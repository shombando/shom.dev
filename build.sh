#!/usr/bin/env bash
set -euo pipefail

emacs -Q --script build.el
echo "Build with Hugo"
hugo
