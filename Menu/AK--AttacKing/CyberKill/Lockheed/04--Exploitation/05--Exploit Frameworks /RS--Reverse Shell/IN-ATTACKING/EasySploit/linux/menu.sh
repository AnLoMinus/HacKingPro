menu(){
	echo "Platform : Linux"
	echo ""
	echo "Select Payload Type
	0) Reverse TCP Shell
	1) Reverse HTTP Shell
	2) Not Available
	3) Not Available
	4) Not Available
	5) Not Available
	x) Exit
	"
	echo -n "What should I PWN ?: "
	read MENU

	case "$MENU" in
	 0) sh linux/reverse_tcp.sh ;;
	 1) sh linux/reverse_http.sh ;;
#	 2) TBD ;;
#	 3) TBD ;;
#	 4) TBD ;;
#	 5) TBD ;;
	 'x'|'X') echo "Goodbye." && exit ;;
	 *) echo "${bold}That's not an answer!${none}\n" &&  menu ;;
	esac
	echo ""
	menu
}

menu
