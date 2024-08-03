{pkgs, ...}: {
  imports = [
    ./fzf
    ./git
    ./ssh
  ];

  home = {
    packages = with pkgs; [
      alejandra
      bat
      cargo-nextest
      cargo-watch
      cargo-zigbuild
      fnm
      gcc
      gh
      ghq
      git
      go
      grpcurl
      htop
      httpie
      jq
      lazygit
      mmv-go
      mycli
      nodePackages.pnpm
      nodejs
      patchelf
      pgcli
      protobuf
      ripgrep
      rustup
      sqlx-cli
      tig
      tree
    ];
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };
  };
}
