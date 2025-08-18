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
  networking.hostName = "dell7506";

  system.stateVersion = "25.05";
}
