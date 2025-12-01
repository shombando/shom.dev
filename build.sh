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
if [[ "$(uname -n)"  == "pc-pop" ||  "$(uname -n)"  == "framework" ]]; then hugo server --buildDrafts --navigateToChanged --disableFastRender; fi
