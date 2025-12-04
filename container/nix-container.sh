#!/usr/bin/env bash
set -euo pipefail

podman run \
			 -v ./:/workdir \
			 --rm -it \
			 --entrypoint "/workdir/container/nix-develop.sh" \
			 git.shom.dev/shom/nixos:emacs29
