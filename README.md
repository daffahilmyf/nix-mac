# Nix-darwin macOS configuration

This repo is a modular, declarative macOS configuration using nix-darwin + home-manager.
It is organized to be reusable across multiple hosts and users while keeping changes atomic.

## Layout

- `flake.nix`: Entry point and input pinning.
- `hosts/`: Host-specific definitions.
  - `hosts/common.nix`: Shared system config across hosts.
  - `hosts/simple/default.nix`: One host profile wiring modules + user.
- `modules/`: Reusable modules.
  - `modules/nix.nix`: Nix settings, GC policy, configuration revision.
  - `modules/system.nix`: System services and shells.
  - `modules/users.nix`: Placeholder for user-related defaults.
  - `modules/home-manager.nix`: Home-manager integration.
- `home/`: Home-manager profiles per user.
  - `home/daffahilmyf.nix`: User packages + programs.

## How it works

- `flake.nix` defines a `mkDarwinSystem` helper that builds a darwin system for each host.
- Each host imports shared modules and then sets host-specific values like hostname, platform, and the primary user.
- Home-manager is integrated as a darwin module so user config is fully declarative and builds atomically with the system.

## Build / switch

```sh
# build only
 darwin-rebuild build --flake .#simple

# apply the configuration
 darwin-rebuild switch --flake .#simple
```

## Common edits

- Add system-wide packages in `hosts/common.nix`.
- Add user packages and settings in `home/daffahilmyf.nix`.
- Add new hosts by creating `hosts/<name>/default.nix` and wiring them in `flake.nix`.

## Notes

- `system.stateVersion = 6;` matches current nix-darwin defaults; only change if you understand the implications.
- The current host name is `Daffa` and user is `daffahilmyf`.
- The flake configuration name is `daffa-dev`.
- Homebrew is enabled with an empty set of taps/brews/casks; add what you need in `modules/homebrew.nix`.
