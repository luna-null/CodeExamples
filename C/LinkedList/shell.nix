with import <nixpkgs> { };

clangStdenv.mkDerivation {
  name = "dev-shell";

  src = null;

  nativeBuildInputs = [ bear clang ];
  buildInputs = [ clang ];

  shellHook = ''
    #!/bin/sh

    buildcpath() {
      local path
      while (( $# )); do
        case $1 in
            -isystem)
                shift
                path=$path${path:+':'}$1
        esac
        shift
      done
      echo $path
    }

              
    export CPATH=${CPATH}${CPATH:+':'}$(buildcpath ${NIX_CFLAGS_COMPILE})
    export CPATH=${CPATH}${CPATH:+':'}@libc_includes@
    export CPLUS_INCLUDE_PATH=${CPATH}${CPATH:+':'}@libcpp_includes@

              
    exec -a "$0" @clang@/bin/$(basename $0) "$@"
  '';
}
