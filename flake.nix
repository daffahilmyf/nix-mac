{
  description = "Personal Daffa's Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }:
  let
    mkDarwinSystem = { hostName, system, username }: nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        (import ./hosts/daffa-dev {
          inherit hostName system username;
        })
      ];
      specialArgs = {
        inherit inputs;
      };
    };
  in
  {
    darwinConfigurations = {
      daffa-dev = mkDarwinSystem {
        hostName = "Daffa";
        system = "aarch64-darwin";
        username = "daffahilmyf";
      };
    };
  };
}
