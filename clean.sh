#!/bin/bash

# Build the project

set -o errexit
set -o nounset
set -o pipefail
readonly DEBUG=${DEBUG:-false}
[[ "${DEBUG}" == 'true' ]] && set -o xtrace

readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"
echo "$(tput bold)$(basename $DIR) $(basename "${BASH_SOURCE[0]%.*}")$(tput sgr0)"

# Remove the content of the dist-directory and all object-files
git clean -dx --force -- ./\*.o dist
