

unstow_config_files () {
    echo "unstowing home config files"
    stow -d ./home -t ~/ -D . --verbose
    echo "home config files unstowed"
}


stow_config_files () {
    echo "stowing home config files"
    stow -d ./home -t ~/ . --verbose
    echo "home config files stowed"
}


install_dependencies (){
    pkg install stow
    pkg install vim
    pkg install emacs
    pkg install gh
    pkg install git
    pkg install python
}


main_help () {
	cat << EOF
Available Commands:
	stow
	unstow
    install_dependwncies
EOF
}


main_commands () {
	case $1 in 
		"--help" | "-h")
			main_help
			;;
		"unstow")
			unstow_config_files 
			;;
		"stow")
			stow_config_files
			;;

        "install_dependencies")
            install_dependencies
            ;;
		*)
			echo "Command '$1' not recognized"
			main_help
			;;
	esac	
}


main_commands "$@"

