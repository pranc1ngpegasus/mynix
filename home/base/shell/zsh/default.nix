{...}: {
  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    initExtra = ''
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
    '';
  };
}
