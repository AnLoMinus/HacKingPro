menu(){
	echo "Platform : Web/"
	echo ""
	echo "Select Payload Type
	0) Reverse PHP TCP Shell
	1) Reverse PHP HTTP Shell
	2) Reverse JSP TCP Shell
	3) Reverse JSP HTTP Shell
	4) Reverse WAR TCP Shell
	5) Reverse WAR HTTP Shell
	x) Exit
	"
	echo -n "What should I PWN ?: "
	read MENU

	case "$MENU" in
	 0) sh web/reverse_tcp_php.sh ;;
	 1) sh web/reverse_http_php.sh ;;
	 2) sh web/reverse_tcp_jsp.sh
	 3) sh web/reverse_http_jsp.sh
	 4) sh web/reverse_tcp_war.sh ;;
	 5) sh web/reverse_http_war.sh ;;
	 'x'|'X') echo "Goodbye." && exit ;;
	 *) echo "${bold}That's not an answer!${none}\n" &&  menu ;;
	esac
	echo ""
	menu
}

menu
