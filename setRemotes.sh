#!/usr/bin/sh
set -eu
git remote add external git@codeberg.org:shom/shom.dev.git
git remote set-url --push external --add git@codeberg.org:shom/shom.dev.git 
git remote set-url --push external --add git@git.sr.ht:~shom/shom.dev
git remote set-url --push external --add git@github.com:shombando/shom.dev.git
