{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usbhid" ];
    };
 
    kernelModules = [ "kvm-intel" ];

    zfs.devNodes = "/dev/disk/by-partlabal";
  };

  networking.hostId = "1afade11";

  fileSystems = {
      "/" = {
        device = "dell7506-zroot/state/root";
        fsType = "zfs";
      };
  
      "/nix" = {
        device = "dell7506-zroot/built/nix";
        fsType = "zfs";
      };
  
      "/home" = {
        device = "dell7506-zroot/safe/home";
        fsType = "zfs";
        # Required for `hashedPasswordFile` etc. to work properly
        neededForBoot = true;
      };
  
      "/boot" = {
        device = "/dev/disk/by-partlabel/dell7506-zboot";
        fsType = "vfat";
        neededForBoot = false;
      };
    };

  hardware = {
    cpu.intel.updateMicrocode = true;
    enableAllFirmware = true;
  };
}
