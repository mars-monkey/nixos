{ pkgs, lib, ... }:

{
  users = {
    mutableUsers = false;

    groups."mars-monkey" = {};

    users.mars-monkey = {
      group = "mars-monkey";
      isNormalUser = true;
      extraGroups = [ "wheel" "libvirtd" /*"video" "netdev"*/ ];
      createHome = true;
      hashedPassword = "$y$j9T$PPMehWHX4aaQ5oMN3igBV0$zXYtqyL4ez7knABEGRMIYTPk1YERI/aY/qOaxXXq1q5";
    };
  };
  services.xserver.desktopManager.gnome.enable = true;
  environment.systemPackages = with pkgs; [
    git
    neovim
];
}
