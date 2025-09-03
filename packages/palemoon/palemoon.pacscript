pkgname="palemoon"
gives="${pkgname}"
arch=("amd64")
pkgver="33.8.2"
pkgdesc="Web Browser / palemoon"
maintainer="develop <develop@home.heaven>"
source=("https://rm-us.palemoon.org/release/palemoon-33.8.2.linux-x86_64-gtk3.tar.xz")
url="https://github.com/samwhelp/anduinos-pacstall/tree/main/packages/palemoon"
depends=()
pacdeps=()
replace=()




##
## ## Link
##
## * https://github.com/samwhelp/demo-for-anduinos-discussion/tree/main/demo/installer/palemoon/demo-start
##




util_copy_from_srcdir_to_desdir () {

	local src_dir_path="${1}"
	local des_dir_path="${2}"


	echo
	echo mkdir -p "${src_dir_path}"
	mkdir -p "${src_dir_path}"


	echo
	echo mkdir -p "${des_dir_path}"
	mkdir -p "${des_dir_path}"


	echo
	echo cp -rfT "${src_dir_path}" "${des_dir_path}"
	cp -rfT "${src_dir_path}" "${des_dir_path}"


	echo

	return 0

}




mode_palemoon_install_main () {

	local src_dir_path="${prjdir}"
	local des_dir_path="${pkgdir}/usr/share/palemoon"

	util_copy_from_srcdir_to_desdir "${src_dir_path}" "${des_dir_path}"


	return 0
}

mode_palemoon_install_bin () {


	local prj_dir_path="${pkgdir}/usr/share/palemoon"

	local bin_dir_path="${pkgdir}/usr/bin"
	local bin_file_path="${bin_dir_path}/palemoon"


	echo
	echo mkdir -p "${bin_dir_path}"
	mkdir -p "${bin_dir_path}"


	echo
	echo ln -sf "/usr/share/palemoon/palemoon" "${bin_file_path}"
	ln -sf "/usr/share/palemoon/palemoon" "${bin_file_path}"


	return 0
}

mode_palemoon_install_desktop_entry () {


	local prj_dir_path="${pkgdir}/usr/share/palemoon"

	local applications_dir_path="${pkgdir}/usr/share/applications"
	local applications_file_path="${applications_dir_path}/palemoon.desktop"


	echo
	echo mkdir -p "${applications_dir_path}"
	mkdir -p "${applications_dir_path}"


cat << __EOF__ | tee "${applications_file_path}"
[Desktop Entry]
Version=1.0
Name=Pale Moon Web Browser
Comment=Browse the World Wide Web
Keywords=Internet;WWW;Browser;Web;Explorer
Exec=palemoon %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=palemoon
Categories=Network;WebBrowser;Internet
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true
__EOF__




	return 0
}



package () {

	echo
	echo "##"
	echo "## ## Call package"
	echo "##"
	echo

	#pwd


	#pkgdir="${pkgdir}"

	#prjdir="${_archive}"

	prjdir="${srcdir}/palemoon"


	echo
	echo mkdir -p "${prjdir}"
	mkdir -p "${prjdir}"


	echo
	echo mkdir -p "${pkgdir}"
	mkdir -p "${pkgdir}"




	mode_palemoon_install_main

	mode_palemoon_install_bin

	mode_palemoon_install_desktop_entry




	echo
	echo "##"
	echo "## ## Done"
	echo "##"
	echo


	return 0
}
