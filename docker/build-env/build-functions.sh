setup () {
  pushd /vagrant
  ./autogen.sh &&
  ./configure &&
  ./facebook-clang-plugins/clang/setup.sh 
  popd
}

build () {
  pushd /vagrant
  if [ -n "$1" ]; then
    make -j${JOBS:-4} BUILD_MODE=$1
  else
    make -j${JOBS:-4} byte
  fi
  popd
}

export PATH=/vagrant/infer/bin:$PATH
