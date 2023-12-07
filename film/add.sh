#!/usr/bin/env bash
set -euo pipefail

read -p "Photo date: " photo_date
read -p "Photo slug: " photo_slug
read -p "Photo description: " photo_description
photo_dir="${photo_date}_${photo_slug}"

mkdir ./${photo_dir}
cd ./${photo_dir}
echo "---" > index.md
echo "title: ${photo_slug}" >> index.md
echo "date: ${photo_date}" >> index.md
echo "description: ${photo_description}" >> index.md

echo "$(cat ../.template/index.md)" >> index.md

echo "Editing the tags in ${photo_dir}/index.md"

vi index.md
