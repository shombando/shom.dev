#!/usr/bin/env bash
set -euo pipefail

podman run -it \
--env 'NIX_CONFIG=experimental-features = nix-command flakes' \
-v ./:/workdir \
--rm --interactive --tty \
--entrypoint "/workdir/container/nix-develop.sh" \
nixos/nix
