#!/usr/bin/env bash
set -euo pipefail

podman run -it \
--env 'NIX_CONFIG=experimental-features = nix-command flakes' \
-v ./:/workdir \
--rm --interactive --tty \
--entrypoint "/workdir/container/nix-develop.sh" \
#docker.io/nixos/nix
git.shom.dev/shom/nixos:emacs29
