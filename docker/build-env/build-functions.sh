setup () {
  pushd /vagrant
  ./build-infer.sh --only-setup-opam &&
  eval $(opam env) &&
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
