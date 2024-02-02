#!/usr/bin/env bash
set -euo pipefail

echo "+++ Remove previous build artifacts +++"
rm -rf ./content
rm -rf ./public/
echo ""

# Run CI/CD build script
source ./build.sh

echo "+++ Start Hugo server showing drafts +++"
hugo server -D
