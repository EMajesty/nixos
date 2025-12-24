#!/bin/sh
set -euo pipefail
git add .
git commit -m "good shit"
git push
sudo nix flake update
sudo nixos-rebuild switch --flake /home/emaj/nixos#laptop
# sudo nix-env --profile "/nix/var/nix/profiles/system" --delete-generations "14d"
# sudo nix-collect-garbage -d
# sudo nixos-rebuild boot --flake /home/emaj/nixos#laptop
