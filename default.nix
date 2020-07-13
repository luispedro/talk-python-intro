
with (import (builtins.fetchTarball {
  name = "nixml-stable-20.07";
  url = https://github.com/nixos/nixpkgs/archive/a1a8e7b0217fd6a72a5d008d8dfb3fdf8ba92e00.tar.gz;
  sha256 = "18xna03j2vp551f2x80w7y02865hvpmrppp5i6mxp2g36bldym6h";
}) {});

let
  pwp = python37.buildEnv.override {
    extraLibs = (with python37Packages; [
        jupyter_client
        jupyter_console
        notebook
        ipywidgets
        ipykernel
        nbformat
        ipython
        seaborn
        matplotlib
        numpy
        scipy
    ]);
    ignoreCollisions = true;
 };

in

stdenv.mkDerivation {
  name = "pynix-env";
  buildInputs = [
    pwp
  ];
}
