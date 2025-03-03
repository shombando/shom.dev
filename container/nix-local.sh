#!/usr/bin/env bash
set -euo pipefail

nix  --extra-experimental-features nix-command --extra-experimental-features flakes develop --command ./build.sh --gc
