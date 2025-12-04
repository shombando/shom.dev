#!/usr/bin/env bash
set -euo pipefail
podman run -p 1313:1313 -v ./:/workdir --rm -it git.shom.dev/shom/nixos:emacs29 hugo server --bind 0.0.0.0 --buildDrafts --navigateToChanged --disableFastRender
