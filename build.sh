#!/usr/bin/env bash
set -euo pipefail
# Generate Hugo markdown using ox-hugo
emacs -Q --script build.el

echo ":\n ==== Process images and remove GPS info ===="
cp -r images/* content/posts/
find . -name '*.jpg' -exec exiftool -GPS:All= {}

echo ":\n ==== Build with Hugo ===="
hugo
