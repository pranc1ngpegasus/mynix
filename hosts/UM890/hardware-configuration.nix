{
  config,
  lib,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      grub = {
        devices = ["nodev"];
      };
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/28a3f1da-2b51-4998-8f5a-9b3ec26b3ed2";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/B41B-83CB";
      fsType = "vfat";
      options = ["fmask=0022" "dmask=0022"];
    };
  };

  hardware = {
    cpu = {
      amd = {
        updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      };
    };
  };

  networking = {
    useDHCP = lib.mkDefault true;
  };
}
