#!/usr/bin/env bash
set -euo pipefail

cd /workdir
nix develop --command /workdir/build.sh --gc
