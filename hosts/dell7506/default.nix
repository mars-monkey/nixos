{ pkgs, lib, ... }:

{
  imports = [
    ./hardware.nix
    ./config.nix
  ];

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config.allowUnfree = true;
  };

  system.stateVersion = "25.05";
}
