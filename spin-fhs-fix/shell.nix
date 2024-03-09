{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {} }:

(pkgs.buildFHSEnv {
  name = "spin-fhs-fix";
  targetPkgs = pkgs: (with pkgs; [
    vim
    git
    nodejs
    fermyon-spin
  ]);
  runScript = "bash";
}).env
