

unstow_config_files () {
    echo "unstowing home config files"
    stow -d ./ -t ~/ -D . --verbose
    echo "home config files unstowed"
}


stow_config_files () {
    echo "stowing home config files"
    stow -d ./ -t ~/ . --verbose
    echo "home config files stowed"
}


main_help () {
	cat << EOF
Available Commands:
	stow
	unstow
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
		*)
			echo "Command '$1' not recognized"
			main_help
			;;
	esac	
}


main_commands "$@"

