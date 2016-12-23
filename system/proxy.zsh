# Configure proxy settings in your ~/.localrc to keep them private
#export DOT_http_proxy=
#export DOT_no_proxy=

# Enable proxy settings
function proxy {
	export http_proxy=$DOT_http_proxy
	export https_proxy=$http_proxy
	export ftp_proxy=$http_proxy
	export no_proxy=$DOT_no_proxy

	export HTTP_PROXY=$http_proxy
	export HTTPS_PROXY=$http_proxy
	export FTP_PROXY=$http_proxy
	export NO_PROXY=$no_proxy
}

# Disable proxy settings
function noproxy {
	unset http_proxy https_proxy ftp_proxy no_proxy
	unset HTTP_PROXY HTTPS_PROXY FTP_PROXY NO_PROXY
}

# Disable proxy by default
#proxy
