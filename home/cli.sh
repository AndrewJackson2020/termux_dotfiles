

main_help () {
	cat << EOF
Available Commands:
	download_encrypted_cloud_files | d
		Download encrypted .7z file from google cloud unencrypt and unzip files to local storage
	upload_encrypted_cloud_files 
EOF
}


help_download_encrypted_cloud_files (){
	cat << EOF
Function to encrypt and upload files to external cloud Bucket storage

flags:
	--document_type | d
		Document type to download, corresponds to subfolder
EOF
}


download_encrypted_cloud_files () {

	set -e

	case $1 in
		"--help" | "-h")
			help_download_encrypted_cloud_files 		
			;;
		"--document_type" | "-d")
			document_type=$2	
			;;
		*)
			echo "'$1' not recognized"
			help_download_encrypted_cloud_files 		
			exit
			;;
	esac

	mkdir -p "~/cloud_documents/staging/"
	mkdir -p "~/cloud_documents/unzipped/${document_type}"

	rm -f "~/cloud_documents/staging/${document_type}.zip"
	rm -f "~/cloud_documents/unzipped/${document_type}/*"

	gsutil cp \
		"gs://documents_asdfoaucds/${document_type}.7z" \
		"~/cloud_documents/staging/"
	cd "~/cloud_documents"
	7z x  "-ounzipped/${document_type}" "${HOME}/cloud_documents/staging/${document_type}.7z"
	cd -
}


help_upload_encrypted_cloud_files () {
	cat << EOF
Function to encrypt and upload files to external cloud Bucket storage

flags:
	--document_type | d
		Document type to upload, corresponds to subfolder
EOF
}


upload_encrypted_cloud_files () {

	set -e

	case $1 in
		"--help" | "-h")
			help_download_encrypted_cloud_files 		
			;;
		"--document_type" | "-d")
			document_type=$2	
			;;
		*)
			echo "'$1' not recognized"
			help_download_encrypted_cloud_files 		
			exit
			;;
	esac

	echo "Please Enter Password"
	read password
	rm -f ~/cloud_documents/staging/*

	cd ~/cloud_documents
	7z a "-p${password}" -mhe=on "staging/${document_type}.7z" "unzipped/${document_type}/*"
	cd -

	gsutil cp \
		"${HOME}/cloud_documents/staging/${document_type}.7z" \
		"gs://documents_asdfoaucds/${document_type}.7z"
}


cli () {
	case $1 in
		"--help" | "-h")
			main_help
			;;
		"u" | "upload_encrypted_cloud_files")
			upload_encrypted_cloud_files "${@:2}"

			;;
        "d" | "download_encrypted_cloud_files")
			download_encrypted_cloud_files "${@:2}"
			;;
		*)
			echo "Command '$1' not recognized"
			main_help
			;;
	esac
}


cli "$@"

