export SYNCTHING_PACKAGE_VERSION=0.14.8
export SYNCTHING_VERSION=v${SYNCTHING_PACKAGE_VERSION}
export SYNCTHING_PLATFORM=linux-amd64
export SYNCTHING_DOWNLOAD_FILE=syncthing-${SYNCTHING_PLATFORM}-${SYNCTHING_VERSION}.tar.gz
export SYNCTHING_DOWNLOAD_FOLDER=syncthing-${SYNCTHING_PLATFORM}-${SYNCTHING_VERSION}

pkg_origin=kellpossible
pkg_name=syncthing
pkg_version=${SYNCTHING_PACKAGE_VERSION}
pkg_maintainer="Luke Frisken <l.frisken@gmail.com>"
pkg_license=()
pkg_upstream_url=https://github.com/syncthing/syncthing
pkg_source=https://github.com/syncthing/syncthing/releases/download/${SYNCTHING_VERSION}/${SYNCTHING_DOWNLOAD_FILE}
pkg_deps=(
)
pkg_build_deps=(
	core/curl
	core/gnupg
	)
pkg_expose=(
	8384
	22000
	21027
)

# temporary override to avoid having to download every time!
# do_download() {
# 	cp $PLAN_CONTEXT/../${SYNCTHING_DOWNLOAD_FILE} $HAB_CACHE_SRC_PATH/
# 	return 0
# }

do_verify() {
	pushd $HAB_CACHE_SRC_PATH
	# curl -sLO https://github.com/syncthing/syncthing/releases/download/${SYNCTHING_VERSION}/sha1sum.txt.asc
	# sha1sum --ignore-missing --quiet -c sha1sum.txt.asc syncthing-linux-amd64-v0.14.8.tar.gz
	# echo "sha1sum result: $?"

	# gpg --keyserver pool.sks-keyservers.net --recv-key 49F5AEC0BCE524C7 D26E6ED000654A3E
	# gpg --verify sha1sum.txt.asc
	popd
	return 0
}


do_build() {
	return 0
}

do_install() {
	pushd $HAB_CACHE_SRC_PATH
	find .
	cp -v ${SYNCTHING_DOWNLOAD_FOLDER}/syncthing ${pkg_prefix}
	cp -v ${SYNCTHING_DOWNLOAD_FOLDER}/AUTHORS.txt ${pkg_prefix}
	cp -v ${SYNCTHING_DOWNLOAD_FOLDER}/LICENSE.txt ${pkg_prefix}
	cp -v ${SYNCTHING_DOWNLOAD_FOLDER}/README.txt ${pkg_prefix}
	cp -rv ${SYNCTHING_DOWNLOAD_FOLDER}/etc ${pkg_prefix}/etc
	popd
}