#!/bin/bash

set -e

VERSION_LINE=$(grep 'version:' pubspec.yaml)
VERSION=$(echo $VERSION_LINE | awk '{print $2}')

NAME=$(echo $VERSION | cut -d '+' -f 1)
BUILD=$(echo $VERSION | cut -d '+' -f 2)

IFS='.' read -r MAJOR MINOR PATCH <<< "$NAME"

MAJOR=$((MAJOR + 1))
MINOR=0
PATCH=0
BUILD=$((BUILD + 1))

NEW_VERSION="$MAJOR.$MINOR.$PATCH+$BUILD"

sed -i.bak "s/version: .*/version: $NEW_VERSION/" pubspec.yaml

echo "✅ Updated version: $NEW_VERSION"