#!/usr/bin/env bash
set -euo pipefail
# Generate Hugo markdown using ox-hugo
emacs -Q --script build.el

echo ":\n ==== Process images and remove GPS info ===="
LC_ALL=C ; find ./images/ ./static -name '*.jpg' -exec exiftool -overwrite_original "-gps*=" {} \;
cp -r images/* content/posts/

echo ":\n ==== Copy film photo posts into content folder ===="
cp -r ./film ./content/
rm -rf ./content/film/.template

echo ":\n ==== Build with Hugo ===="
hugo

cp ./.well-known -r ./public/
