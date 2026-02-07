{ pkgs, ... }:
{
  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    discord
    spotify
  ];

  programs.git.enable = true;
  programs.git.settings = {
    user = {
      name = "Daffa Hilmy Fadhlurrohman";
      email = "daffahilmanafrizal@gmail.com";
      signingKey = "/Users/daffahilmyf/.ssh/github.pub";
    };
    gpg = {
      format = "ssh";
    };
    commit = {
      gpgsign = true;
    };
  };

  programs.starship.enable = true;
  programs.pyenv.enable = true;
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
    shellAliases = {
      k = "kubectl";
      kns = "kubens";
      kctx = "kubectx";
    };
    initContent = ''
      # Use Homebrew completions when available
      if [[ -d /opt/homebrew/share/zsh/site-functions ]]; then
        fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
      fi

      # Ensure nix and nix-darwin are on PATH (Terminal + Zellij)
      if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
        source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      elif [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix.sh ]]; then
        source /nix/var/nix/profiles/default/etc/profile.d/nix.sh
      fi

      # nvm (installed via Homebrew)
      export NVM_DIR="$HOME/.nvm"
      if [[ -s "/opt/homebrew/opt/nvm/nvm.sh" ]]; then
        source "/opt/homebrew/opt/nvm/nvm.sh"
      fi
      if [[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ]]; then
        source "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
      fi

      # zoxide
      if command -v zoxide >/dev/null 2>&1; then
        eval "$(zoxide init zsh)"
      fi
    '';
  };

  home.sessionVariables = {
    GOPATH = "$HOME/go";
    GOBIN = "$HOME/go/bin";
    KUBECONFIG = "$HOME/.kube/k3s.yaml";
  };

  home.sessionPath = [
    "/nix/var/nix/profiles/default/bin"
    "/nix/var/nix/profiles/default/sbin"
    "$HOME/.cargo/bin"
    "$GOBIN"
    "/opt/homebrew/opt/openjdk/bin"
  ];

  xdg.configFile."zellij/config.kdl" = {
    source = if pkgs.stdenv.isDarwin then ./zellij/config.darwin.kdl else ./zellij/config.linux.kdl;
    force = true;
  };
}
