

main_help () {
	cat << EOF
Available Commands:
EOF
}




cli () {
	case $1 in 
		"--help" | "-h")
			main_help
			;;
		*)
			echo "Command '$1' not recognized"
			main_help
			;;
	esac	
}
PATH=$PATH:~/.config/emacs/bin
