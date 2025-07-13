{ pkgs ? import (import ./nixpkgs.nix) { allowUnfree = true; }}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    terraform
  ];
}
