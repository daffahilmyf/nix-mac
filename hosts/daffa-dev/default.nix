{ hostName, system, username }:
{ config, pkgs, inputs, ... }:
{
  imports = [
    ../common.nix
    ../../modules/nix.nix
    ../../modules/system.nix
    ../../modules/users.nix
    ../../modules/home-manager.nix
    ../../modules/homebrew.nix
  ];

  networking.hostName = hostName;
  networking.computerName = "Daffa";
  nixpkgs.hostPlatform = system;
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 6;
  system.primaryUser = username;

  home-manager.users.${username} = import ../../home/${username}.nix;
}
