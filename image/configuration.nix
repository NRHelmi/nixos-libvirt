{ config, pkgs, ... }:
let
  readFirst = filenames: builtins.readFile
    (builtins.head (builtins.filter builtins.pathExists filenames));

  sshKey = readFirst [ ~/.ssh/id_ed25519.pub ~/.ssh/id_rsa.pub ];
in
{
  imports = [ <nixpkgs/nixos/modules/virtualisation/qemu-vm.nix> ];

  users.users.nixos = {
    isNormalUser = true;
    shell = pkgs.bash;
    openssh.authorizedKeys.keys = [ sshKey ];
  };

  services.openssh.enable = true;

  networking.firewall.enable = false;

  system.stateVersion = "24.11";
}
