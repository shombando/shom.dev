#!/usr/bin/env bash
set -euo pipefail

read -p "Photo date: " photo_date
read -p "Photo slug: " photo_slug
photo_dir="${photo_date}_${photo_slug}"

cp -r ./.template/ ./${photo_dir}
