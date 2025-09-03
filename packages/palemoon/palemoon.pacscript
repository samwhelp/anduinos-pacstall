pkgname="palemoon"
gives="${pkgname}"
arch=("all")
pkgver="0.1.1"
pkgdesc="Web Browser / palemoon"
maintainer="develop <develop@home.heaven>"
source=("https://rm-us.palemoon.org/release/palemoon-33.8.2.linux-x86_64-gtk3.tar.xz")
url="https://github.com/samwhelp/anduinos-pacstall/tree/main/packages/palemoon"
depends=()
pacdeps=()
replace=()




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




	echo
	echo "##"
	echo "## ## Done"
	echo "##"
	echo


	return 0
}
