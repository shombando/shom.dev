#!/usr/bin/env bash
set -euo pipefail

emacs -Q --script build.el
cp -r images/* content/posts/
echo "\n==== Build with Hugo ===="
hugo
