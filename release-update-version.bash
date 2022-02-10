#!/bin/bash

set -e -u -o pipefail

function usage() {
	local name
	name=$(basename "$0")
	echo "$name: Update version to README.md" 1>&2
	echo "Usage: $name [-h] semver" 1>&2
	echo "	-h Show help" 1>&2
	echo "Example: $name 0.2.7" 1>&2
}

while getopts "h" arg; do
	case $arg in
	h|*) # Show help
		usage
		exit 1
	;;
	esac
done

version="${1-}"
if test -z "$version"; then
	usage
	exit 1
fi

sed -i '' -e 's#^    uses: kare/github/\.github/workflows/go-pkg-ci\.yaml@v.*$#    uses: kare/github/.github/workflows/go-pkg-ci.yaml@v'"$version"'#g' README.md
git add README.md
git commit --message="docs: update version in README.md"
