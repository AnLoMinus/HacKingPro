<pre>
msf > use auxiliary/scanner/smb/smb_enum_gpp 
msf auxiliary(smb_enum_gpp) > set SMBUSER test
SMBUSER => test
msf auxiliary(smb_enum_gpp) > set SMBPASS test123
SMBPASS => test123
msf auxiliary(smb_enum_gpp) > set SMBDOMAIN test_domain
SMBDOMAIN => test_domain
msf auxiliary(smb_enum_gpp) > set RHOSTS domain_controller_ip
RHOSTS => domain_controller_ip
msf auxiliary(smb_enum_gpp) > run
</pre>
