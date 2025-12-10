#!/usr/bin/env bash
set -euo pipefail

echo "==== Generate Hugo markdown using ox-hugo ===="
emacs --script build.el
echo ""

echo "==== Copy images to content folder ===="
cp -r images/* content/
echo ""

echo "==== Copy .well-known for webfinger ===="
mkdir -p ./public/
cp ./.well-known -r ./public/
echo ""

if [[ "${1-production}"  == "develop" ]]; then
		echo "==== Starting Hugo Development Server ===="
		hugo server --bind 0.0.0.0 --buildDrafts --navigateToChanged --disableFastRender;
else
		echo "==== Build with Hugo ===="
		hugo
		echo ""
fi
