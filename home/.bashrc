

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
