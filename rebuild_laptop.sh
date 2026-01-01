#!/bin/sh
# set -euo pipefail
git add .
git commit -m "good shit"
git push
sudo nixos-rebuild switch --flake /home/emaj/nixos#laptop
# sudo nixos-rebuild boot --flake /home/emaj/nixos#laptop
