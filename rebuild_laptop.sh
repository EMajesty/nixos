#!/bin/sh
# set -euo pipefail
git add .
git commit -m "good shit"
git push
sudo nix flake update
sudo nixos-rebuild switch --flake /home/emaj/nixos#laptop
sudo nix-collect-garbage --delete-older-than 30d
# sudo nixos-rebuild boot --flake /home/emaj/nixos#laptop
