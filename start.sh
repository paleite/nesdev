#!/bin/bash

# Start the project

set -o errexit
set -o nounset
set -o pipefail
readonly DEBUG=${DEBUG:-false}
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"
echo "$(tput bold)$(basename $DIR) $(basename "${BASH_SOURCE[0]%.*}")$(tput sgr0)"

# Ensure the fceux is installed
if [ ! -f "$(command -v fceux)" ]; then
  echo "fceux does not exist. Please run ./install.sh first."
  exit 1
fi

# Ensure the ROM-image exists and is not empty
if [ ! -f dist/image.nes ]; then
  echo "dist/image.nes does not exist. Please run ./build.sh first."
  exit 1
elif [ ! -s dist/image.nes ]; then
  echo "dist/image.nes is empty. Please run ./build.sh first."
  exit 1
fi

# Ready to retro
fceux dist/image.nes
