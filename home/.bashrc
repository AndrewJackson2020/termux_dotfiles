

main_help () {
	cat << EOF
Available Commands:
    download_encrypted_cloud_files
EOF
}




cli () {
	case $1 in 
		"--help" | "-h")
			main_help
			;;
        "download_encrypted_cloud_files" )
	    local_folder=~/storage/downloads/cloud_documents

            mkdir --parents "${local_folder}/staging"
            mkdir --parents "${local_folder}/unzipped"
            rm -f "${local_folder}/staging/*"
            rm -f "${local_folder}/unzipped/*"
            gsutil cp gs://documents_asdfoaucds/Documents.7z "${local_folder}/staging/"
            cd $local_folder
            7z x  -ounzipped/ "${local_folder}/staging/Documents.7z"
            cd -
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
