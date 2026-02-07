{ pkgs, config, ... }:
let
  username = config.system.primaryUser;
in
{
  users.users.${username} = {
    home = "/Users/${username}";
    shell = pkgs.zsh;
  };
}
