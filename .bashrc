update_obsidian () {
	obsidian_folder=/data/data/com.termux/files/home/storage/shared/Documents/Main
	cd $obsidian_folder
	git pull && git add -A && git commit -a -m "android vault backup: `date +'%Y-%m-%d %H-%M-%S'`" && git push
	cd -
}
