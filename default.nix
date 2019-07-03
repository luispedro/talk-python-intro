
with (import (builtins.fetchTarball {
  name = "nixml-stable-19.04";
  url = https://github.com/nixos/nixpkgs/archive/37694c8cc0e9ecab60d06f1d9a2fd0073bcc5fa3.tar.gz;
  sha256 = "1ibjg6ln2y764wfg0yd0v055jm4xzhmxy5lfz63m6jr3y16jdmzb";
}) {});

let
  pwp = python36.buildEnv.override {
    extraLibs = (with python36Packages; [
        jupyter_client
    jupyter_console
    notebook
    ipywidgets
    ipykernel
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
