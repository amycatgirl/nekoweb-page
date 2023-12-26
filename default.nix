{ pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  name = "amycatgirlSite";
  
  packages = with pkgs; [
    nodejs
    nodejs.pkgs.pnpm
  ];
}
