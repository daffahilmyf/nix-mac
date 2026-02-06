{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    cloudflared
    docker
    git
    go
    cargo
    rustc
    tailscale
    vim
    wireguard-tools
  ];
}
