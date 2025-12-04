#!/usr/bin/env bash
set -euo pipefail

cd /workdir
echo "==== Nix develop ===="
nix --extra-experimental-features nix-command \
		--extra-experimental-features flakes \
		develop --command /workdir/build.sh
