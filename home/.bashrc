

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
            rm -f ~/cloud_documents/staging/*
            rm -f ~/cloud_documents/unzipped/*
            gsutil cp gs://documents_asdfoaucds/Documents.7z ~/cloud_documents/staging/
            cd ~/cloud_documents
            7z x  -ounzipped/ ~/cloud_documents/staging/Documents.7z
            cd -
            ;;
		*)
			echo "Command '$1' not recognized"
			main_help
			;;
	esac	
}
PATH=$PATH:~/.config/emacs/bin
