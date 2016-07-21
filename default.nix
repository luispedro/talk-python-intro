#!/usr/bin/env nix-shell
with import <nixpkgs> {};

let
    envname = "pyintro-talk";
    python = python27Full;
    pyp = pkgs.python27Packages;
in

buildPythonPackage { 
  name = "${envname}-env";
  buildInputs = [
     python
     cacert
    ];
   pythonPath = with pyp; [
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
    pyside
    sqlite3
    readline
    numpydoc
    virtualenv
  ];
  src = null;
  # When used as `nix-shell --pure`
  shellHook = ''
  export NIX_ENV="[${envname}] "
  '';
  # used when building environments
  extraCmds = ''
  export NIX_ENV="[${envname}] "
  '';
}

