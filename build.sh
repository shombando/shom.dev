#!/usr/bin/env bash
set -euo pipefail
# Generate Hugo markdown using ox-hugo
emacs -Q --script build.el

echo ":\n ==== Process images and remove GPS info ===="
find images/ . -name '*.jpg' -exec exiftool "-gps*=" {} \;
cp -r images/* content/posts/

echo ":\n ==== Build with Hugo ===="
hugo
