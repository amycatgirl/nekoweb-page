{ pkgs ? import (fetchTarball("https://github.com/NixOS/nixpkgs/archive/0b3d618173114c64ab666f557504d6982665d328.tar.gz")) {}}:

pkgs.mkShell {
  name = "amycatgirlSite";
  
  packages = with pkgs; [
    nodejs
    nodejs.pkgs.pnpm
  ];
}
