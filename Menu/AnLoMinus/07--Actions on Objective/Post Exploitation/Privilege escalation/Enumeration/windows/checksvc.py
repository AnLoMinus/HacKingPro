import os
import subprocess
import ctypes

# See: https://blogs.msmvps.com/erikr/2007/09/26/set-permissions-on-a-specific-service-windows/

svcinfo = {}
nonadmin = ['AU', 'AN', 'BG', 'BU', 'DG', 'WD', 'IU', 'LG']
FNULL = open(os.devnull, 'w')


def checkadmin():
    return ctypes.windll.shell32.IsUserAnAdmin()


def sliceperms(permstring):
    permparts = []
    if permstring:
        parts = int(len(permstring))
        #        print('%s parts' % parts)
        for i in range(0, parts, 2):
            # print(permstring[i:i+2])
            permparts.append(permstring[i:i + 2])
    return permparts


def getsvcacls(svcname):
    svcacl = None
    try:
        svcacl = subprocess.check_output(['sc', 'sdshow', svcname], stderr=FNULL).decode('utf-8',
                                                                                         'backslashreplace').strip()
    except subprocess.CalledProcessError:
        pass
    return svcacl


def checkuserstartable(svcacl):
    userstartable = False
    if svcacl:
        acllist = svcacl.split(')')
        for acl in acllist:
            if acl:
                if acl.startswith('D:'):
                    acl = acl.replace('D:', '')
                acl = acl.replace('(', '')
                aclparts = acl.split(';')
                usercode = aclparts[-1]
                if usercode in nonadmin:
                    perms = aclparts[2]
                    # print('we have permissions for non-admin(%s): %s' % (usercode, perms))
                    permparts = sliceperms(perms)
                    # print('%s: %s' % (usercode, permparts))
                    if 'RP' in permparts:
                        # print('**** This can be started by a non-admin! ****')
                        userstartable = True

    return userstartable

def checkuserstoppable(svcacl):
    userstoppable = False
    if svcacl:
        acllist = svcacl.split(')')
        for acl in acllist:
            if acl:
                if acl.startswith('D:'):
                    acl = acl.replace('D:', '')
                acl = acl.replace('(', '')
                aclparts = acl.split(';')
                usercode = aclparts[-1]
                if usercode in nonadmin:
                    perms = aclparts[2]
                    # print('we have permissions for non-admin(%s): %s' % (usercode, perms))
                    permparts = sliceperms(perms)
                    # print('%s: %s' % (usercode, permparts))
                    if 'WP' in permparts:
                        # print('**** This can be started by a non-admin! ****')
                        userstoppable = True

    return userstoppable


def checkpathacl(path):
    issues = []
    if path:
        try:
            with open(path, 'ab') as f:
                issues.append('WRITABLE SERVICE HOST')
        except IOError:
            pass

        path = os.path.join(os.path.dirname(path), 'acltest')
        if os.path.exists(path):
            path = path + '1'

        try:
            with open(path, 'wb') as f:
                issues.append('WRITABLE SERVICE HOST DIRECTORY')
            os.unlink(path)
        except IOError:
            pass

    return ', '.join(issues)


def whichfile(file):
    if file:
        fullpath = ''
        try:
            fullpath = subprocess.check_output(['where', file, ], stderr=FNULL).decode('utf-8',
                                                                                       'backslashreplace').strip()
        except subprocess.CalledProcessError:
            pass
        return fullpath


def svchosttarget(svcname):
    parsed = ''
    svctarget = ''
    try:
        parsed = subprocess.check_output(['reg', 'query',
                                          r'HKLM\SYSTEM\CurrentControlSet\Services\%s\Parameters' %
                                          svcname], stderr=FNULL).decode('utf-8', 'backslashreplace')
    except subprocess.CalledProcessError:
        pass

    for line in parsed.splitlines():

        if ' servicedll ' in line.lower():
            lineparts = line.split('    REG_EXPAND_SZ    ')
            svctarget = os.path.expandvars((lineparts[-1]))

    if not os.path.exists(svctarget):
        svctarget = whichfile(svctarget)

    return svctarget


def checkservices():
    nameindex = None
    dispnameindex = None
    privindex = None
    stateindex = None
    pathindex = None
    startmodeindex = None
    parsed = subprocess.check_output(['wmic', 'service', 'get', 'name,startname,displayname,state,pathname,startmode,'
                                                                'DesktopInteract',
                                      '/format:csv'], stderr=FNULL).decode(
        'utf-8', 'backslashreplace')
    for line in parsed.splitlines():
        if line:
            columns = line.split(',')
            if line.startswith('Node,'):
                nameindex = columns.index('Name')
                dispnameindex = columns.index('DisplayName')
                privindex = columns.index('StartName')
                stateindex = columns.index('State')
                pathindex = columns.index('PathName')
                startmodeindex = columns.index('StartMode')
                desktopindex = columns.index('DesktopInteract')
            else:
                reasons = []
                svcname = columns[nameindex]
                svcdict = {}
                svcdict['priv'] = columns[privindex]
                svcdict['dispname'] = columns[dispnameindex]
                svcdict['state'] = columns[stateindex]
                svcdict['path'] = columns[pathindex]
                svcdict['startmode'] = columns[startmodeindex]
                svcdict['desktop'] = columns[desktopindex]
                if svcdict['desktop'].lower() == 'true':
                    svcdict['desktop'] = True
                else:
                    svcdict['desktop'] = False
                if 'svchost.exe' in svcdict['path']:
                    realtarget = svchosttarget(svcname)
                    if realtarget:
                        # print('%s uses svchost: %s' % (svcname,realtarget))
                        svcdict['path'] = realtarget
                elif '"' in svcdict['path']:
                    # Quoted path
                    splitpath = svcdict['path'].split('"')
                    if len(splitpath) > 2 and splitpath[2]:
                        # Quoted path with arguments
                        svcdict['path'] = '"%s"' % splitpath[1]
                    else:
                        # Quoted path without arguments
                        pass
                else:
                    # Non-quoted path
                    splitpath = svcdict['path'].split()
                    if len(splitpath) > 1:
                        # Non-quoted path with arguments
                        svcdict['path'] = splitpath[0]
                svcacls = getsvcacls(svcname)
                startable = checkuserstartable(svcacls)
                stoppable = checkuserstoppable(svcacls)
                svcdict['startable'] = False
                if startable and svcdict['startmode'] != 'Disabled':
                    if svcdict['state'] == 'Stopped' or (svcdict['state'] == 'Running' and stoppable):
                        svcdict['startable'] = True

                svcinfo[svcname] = svcdict
                badacls = checkpathacl(svcinfo[svcname]['path'])
                if badacls:
                    reasons.append('Filesystem ACLs')
                if (svcdict['startable'] and svcdict['priv'].lower() == 'localsystem') and not svcdict[
                    'path'].endswith('lsass.exe') and svcdict['path'].lower().replace('"', '').endswith('.exe'):
                    reasons.append('User-controlled and high-privileged')
                if svcdict['desktop'] and svcdict['priv'].lower() == 'localsystem' and (svcdict['state'].lower() == \
                        'running' or svcdict['startable']):
                    reasons.append('Desktop interactive')
                reasons = ', '.join(reasons)
                if reasons:
                    if badacls:
                        print('%s !!!! %s is vulnerable (%s) !!!!' % (os.linesep, svcname, reasons))
                    else:
                        print('%s -=-= %s MAY be vulnerable (%s) =-=-' % (os.linesep, svcname, reasons))
                    print('Service: %s' % svcname)
                    print('Display name: %s' % svcinfo[svcname]['dispname'])
                    print('Privilege: %s' % svcinfo[svcname]['priv'])
                    print('Path: %s' % svcinfo[svcname]['path'])
                    print('State: %s' % svcinfo[svcname]['state'])
                    print('User-startable: %s' % svcinfo[svcname]['startable'])
                    print('Can interact with desktop: %s' % svcinfo[svcname]['desktop'])
                    if badacls:
                        print('ACL Problem(s): %s' % badacls)

if __name__ == "__main__":
    if checkadmin():
        print('Please run this script without administrative privileges.')
    else:
        checkservices()
