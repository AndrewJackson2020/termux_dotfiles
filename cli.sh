#!/bin/bash


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
    pkg install \
            stow \
            vim \
            emacs \
            gh \
            git \
            python

    git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
    ~/.config/emacs/bin/doom install

    curl -o sdk.sh sdk.cloud.google.com
    chmod +x sdk.sh
    ./sdk.sh --install-dir=$PREFIX

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

