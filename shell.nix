# nixpkgs 24.11
{ rev ? "6794d064edc69918bb0fc0e0eda33ece324be17a" }:
let
  pkgs = import pkgsPath { allowUnfree = true; };
  pkgsPath = import ./nixpkgs.nix { inherit rev; };

  make-boot-image = pkgs.writeShellScriptBin "make-boot-image" ''
    nixos-generate -f qcow -c cloudinit -o image/nixos-cloudimg.qcow2 -I nixos-config=./image/configuration.nix -I nixpkgs=${pkgsPath}
  '';
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    terraform
    nixos-generators
    nixVersions.latest

    # commands
    make-boot-image
  ];
}
