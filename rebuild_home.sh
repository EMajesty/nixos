#!/bin/sh
set -euo pipefail
git add .
git commit -m "good shit"
git push
home-manager switch --flake .#emaj
