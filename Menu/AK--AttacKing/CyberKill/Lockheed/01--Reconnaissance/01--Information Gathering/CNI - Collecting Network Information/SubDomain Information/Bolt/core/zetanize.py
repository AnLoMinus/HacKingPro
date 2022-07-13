import re
from urllib.parse import urlparse


def zetanize(url, response):
    parsedUrl = urlparse(url)
    mainUrl = parsedUrl.scheme + '://' + parsedUrl.netloc

    def e(string):
        return string.encode('utf-8')

    def d(string):
        return string.decode('utf-8')

    response = re.sub(r'(?s)<!--.*?-->', '', response)
    forms = {}
    matches = re.findall(r'(?i)(?s)<form.*?</form.*?>', response)
    num = 0
    for match in matches:
        page = re.search(r'(?i)action=[\'"](.*?)[\'"]', match)
        method = re.search(r'(?i)method=[\'"](.*?)[\'"]', match)
        forms[num] = {}
        action = d(e(page.group(1)))
        if not action.startswith('http'):
            if action.startswith('/'):
                action = mainUrl + action
            else:
                action = mainUrl + '/' + action
        forms[num]['action'] = action.replace('&amp;', '&') if page else ''
        forms[num]['method'] = d(
            e(method.group(1)).lower()) if method else 'get'
        forms[num]['inputs'] = []
        inputs = re.findall(r'(?i)(?s)<input.*?>', response)
        for inp in inputs:
            inpName = re.search(r'(?i)name=[\'"](.*?)[\'"]', inp)
            if inpName:
                inpType = re.search(r'(?i)type=[\'"](.*?)[\'"]', inp)
                inpValue = re.search(r'(?i)value=[\'"](.*?)[\'"]', inp)
                inpName = d(e(inpName.group(1)))
                inpType = d(e(inpType.group(1)))if inpType else ''
                inpValue = d(e(inpValue.group(1))) if inpValue else ''
                if inpType.lower() == 'submit' and inpValue == '':
                    inpValue = 'Submit Query'
                inpDict = {
                    'name': inpName,
                    'type': inpType,
                    'value': inpValue
                }
                forms[num]['inputs'].append(inpDict)
        num += 1
    return forms
