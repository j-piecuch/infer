setup () {
  pushd /vagrant
  ./autogen.sh &&
  ./configure &&
  ./facebook-clang-plugins/clang/setup.sh 
  popd
}

build () {
  pushd /vagrant
  make -j${JOBS:-4} BUILD_MODE=${1:-default}
  popd
}
