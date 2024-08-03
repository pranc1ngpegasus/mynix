{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    ./hardware-configuration.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      discord
      firefox
      podman-compose
      podman-tui
      slack
    ];
    variables = {
      PATH = [
        "$HOME/.cargo/bin"
        "$HOME/go/bin"
      ];
    };
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "ja_JP.UTF-8";
      LC_IDENTIFICATION = "ja_JP.UTF-8";
      LC_MEASUREMENT = "ja_JP.UTF-8";
      LC_MONETARY = "ja_JP.UTF-8";
      LC_NAME = "ja_JP.UTF-8";
      LC_NUMERIC = "ja_JP.UTF-8";
      LC_PAPER = "ja_JP.UTF-8";
      LC_TELEPHONE = "ja_JP.UTF-8";
      LC_TIME = "ja_JP.UTF-8";
    };
  };

  networking = {
    hostName = "UM890";
    networkmanager = {
      enable = true;
    };
  };

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  programs = {
    _1password = {
      enable = true;
    };
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = ["pranc1ngpegasus"];
    };
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;
    };
    zsh = {
      enable = true;
    };
  };

  security = {
    rtkit = {
      enable = true;
    };
  };

  services = {
    displayManager = {
      sddm = {
        enable = true;
      };
    };
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
      };
      alsa = {
        support32Bit = true;
      };
      pulse = {
        enable = true;
      };
    };
    printing = {
      enable = true;
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      desktopManager = {
        plasma5 = {
          enable = true;
        };
      };
    };
  };

  system = {
    stateVersion = "24.05";
  };

  time = {
    timeZone = "Asia/Tokyo";
  };

  users = {
    users = {
      pranc1ngpegasus = {
        isNormalUser = true;
        description = "pranc1ngpegasus";
        extraGroups = ["networkmanager" "wheel"];
        shell = pkgs.zsh;
      };
    };
  };

  virtualisation = {
    containers = {
      enable = true;
    };
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork = {
        settings = {
          dns_enabled = true;
        };
      };
    };
  };
}
