{ ... }:
{
  homebrew = {
    enable = true;
    caskArgs = {
      appdir = "/Applications";
    };
    onActivation = {
      cleanup = "zap";
    };
    taps = [
      "hashicorp/tap"
      "oven-sh/bun"
    ];
    brews = [
      "act"
      "oven-sh/bun/bun"
      "cloudflared"
      "dvc"
      "ffmpeg"
      "fd"
      "fzf"
      "gh"
      "helm"
      "hey"
      "htop"
      "hurl"
      "jq"
      "k6"
      "kubectx"
      "kubeseal"
      "kustomize"
      "ripgrep"
      "sops"
      "yq"
      "direnv"
      "eza"
      "bat"
      "tldr"
      "awscli"
      "terraform"
      "terragrunt"
      "age"
      "nvm"
      "openjdk"
      "openssh"
      "poetry"
      "pnpm"
      "pyenv"
      "python@3.12"
      "rust"
      "starship"
      "uv"
      "zellij"
      "zsh-autocomplete"
    ];
    casks = [
      "cloudflare-warp"
      "font-0xproto-nerd-font"
      "font-3270-nerd-font"
      "font-agave-nerd-font"
      "font-anonymice-nerd-font"
      "font-arimo-nerd-font"
      "font-aurulent-sans-mono-nerd-font"
      "font-bigblue-terminal-nerd-font"
      "font-bitstream-vera-sans-mono-nerd-font"
      "font-blex-mono-nerd-font"
      "font-caskaydia-cove-nerd-font"
      "font-caskaydia-mono-nerd-font"
      "font-code-new-roman-nerd-font"
      "font-comic-shanns-mono-nerd-font"
      "font-commit-mono-nerd-font"
      "font-cousine-nerd-font"
      "font-d2coding-nerd-font"
      "font-daddy-time-mono-nerd-font"
      "font-dejavu-sans-mono-nerd-font"
      "font-departure-mono-nerd-font"
      "font-jetbrains-mono-nerd-font"
      "dbeaver-community"
      "docker-desktop"
      "google-chrome"
      "hashicorp-vagrant"
      "postman"
      "slack"
      "whatsapp"
      "tailscale-app"
      "visual-studio-code"
      "redis-insight"
      "zed"
    ];
  };
}
