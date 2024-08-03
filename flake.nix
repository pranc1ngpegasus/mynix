{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zsh-ghq-fzf = {
      url = "github:Pranc1ngPegasus/zsh-ghq-fzf";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    home-manager,
    neovim,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in
    flake-utils.lib.eachDefaultSystem (system: {
      packages = {
        neovim = inputs.neovim.packages.${system}.default;
      };
    })
    // {
      nixConfig = {
        extra-substituters = [
          "https://nix-community.cachix.org"
        ];
        extra-trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
      };
      nixosConfigurations = {
        "UM890" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/UM890
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.users.pranc1ngpegasus = import ./home/nixos;
            }
          ];
          specialArgs = {
            inherit inputs outputs;
          };
        };
      };
    };
}
