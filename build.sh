#!/usr/bin/env bash
set -euo pipefail

emacs -Q --script build.el
echo "\n==== Build with Hugo ===="
hugo
