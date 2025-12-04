#!/usr/bin/env bash
set -euo pipefail

podman run -v ./:/workdir --rm -it git.shom.dev/shom/nixos:emacs29 ./build.sh 
