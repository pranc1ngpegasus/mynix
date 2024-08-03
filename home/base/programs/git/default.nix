{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    extraConfig = {
      core = {
        editor = "nvim";
      };
      commit = {
        gpgsign = true;
      };
      ghq = {
        root = config.home.homeDirectory + "/ghq";
      };
      gpg = {
        format = "ssh";
        "ssh" = {
          program = "${pkgs._1password-gui}/bin/op-ssh-sign";
        };
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        default = "current";
      };
      url = {
        "ssh://git@github.com" = {
          insteadOf = "https://github.com/";
        };
      };
      user = {
        name = "pranc1ngpegasus";
        email = "temma.fukaya@mokmok.dev";
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPrxAPvOxoy8a5y3hp9iKTWGyk+qgBTYv8DgfTnqQR8/";
      };
    };
    ignores = [
      ".envrc"
      ".env"
      ".DS_Store"
      ".tool-versions"
    ];
  };
}
