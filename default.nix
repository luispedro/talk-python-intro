#!/usr/bin/env nix-shell
with import <nixpkgs> {};

let
    p = python27.withPackages (ps: with ps;
          [
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
in
# We need ignoreCollisions because of https://github.com/NixOS/nixpkgs/issues/23855
(p.override { ignoreCollisions = true; }).env
