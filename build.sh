#!/usr/bin/env bash
set -euo pipefail

echo "==== Remove previous build artifacts ===="
rm -rf ./content
rm -rf ./public/
echo ""

echo "==== Generate Hugo markdown using ox-hugo ===="
emacs -Q --script build.el
echo ""

echo "==== Process images and remove GPS info ===="
LC_ALL=C ; find ./images/ ./static -name '*.jpg' -exec exiftool -overwrite_original "-gps*=" {} \;
cp -r images/* content/
echo ""

echo "==== Copy film photo posts into content folder ===="
cp -r ./film ./content/
rm -rf ./content/film/.template
rm ./content/film/add.sh
echo ""

echo "==== Build with Hugo ===="
hugo
echo ""

echo "==== Copy .well-known for webfinger ===="
cp ./.well-known -r ./public/
echo ""
