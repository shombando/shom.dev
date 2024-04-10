#!/usr/bin/env bash
set -euo pipefail

# Run CI/CD build script
source ./build.sh
htmltest
