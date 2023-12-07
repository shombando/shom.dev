#!/usr/bin/env bash
set -euo pipefail
# Generate Hugo markdown using ox-hugo
emacs -Q --script build.el

echo "==== Process images and remove GPS info ===="
LC_ALL=C ; find ./images/ ./static -name '*.jpg' -exec exiftool -overwrite_original "-gps*=" {} \;
cp -r images/* content/posts/
echo ""

echo "==== Copy film photo posts into content folder ===="
cp -r ./film ./content/
rm -rf ./content/film/.template
echo ""

echo "==== Build with Hugo ===="
hugo
echo ""

echo "==== Copy .well-known for webfinger ===="
cp ./.well-known -r ./public/
echo ""
