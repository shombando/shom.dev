#!/usr/bin/env bash
set -euo pipefail

echo "==== Generate Hugo markdown using ox-hugo ===="
emacs --script build.el
echo ""

echo "==== Copy images to content folder ===="
cp -r images/* content/
echo ""

echo "==== Build with Hugo ===="
hugo
echo ""

echo "==== Copy .well-known for webfinger ===="
cp ./.well-known -r ./public/
echo ""
if [[ "${1-production}"  == "develop" ]]; then
		hugo server --bind 0.0.0.0 --buildDrafts --navigateToChanged --disableFastRender;
fi
