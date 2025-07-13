{ rev }:
builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz"
