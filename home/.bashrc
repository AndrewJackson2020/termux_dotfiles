

main_help () {
	cat << EOF
Available Commands:
	sync_obsidian	
EOF
}


update_obsidian () {
	obsidian_folder=/data/data/com.termux/files/home/storage/shared/Documents/Main
	cd $obsidian_folder
	git pull && git add -A && git commit -a -m "android vault backup: `date +'%Y-%m-%d %H-%M-%S'`" && git push
	cd -
}


cli () {
	case $1 in 
		"--help" | "-h")
			main_help
			;;
		"sync_obsidian")
			update_obsidian 
			;;
		*)
			echo "Command '$1' not recognized"
			main_help
			;;
	esac	
}
PATH=$PATH:~/.config/emacs/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/data/data/com.termux/files/usr/google-cloud-sdk/path.bash.inc' ]; then . '/data/data/com.termux/files/usr/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/data/data/com.termux/files/usr/google-cloud-sdk/completion.bash.inc' ]; then . '/data/data/com.termux/files/usr/google-cloud-sdk/completion.bash.inc'; fi
