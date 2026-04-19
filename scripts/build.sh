#!/bin/bash

set -e

echo "Select build mode:"
echo "1) Debug"
echo "2) Release"
read -p "Enter choice: " mode_choice

if [ "$mode_choice" == "1" ]; then
  MODE="debug"
elif [ "$mode_choice" == "2" ]; then
  MODE="release"
else
  echo "Invalid mode"
  exit 1
fi

echo "Select platform:"
echo "1) Android"
echo "2) iOS"
echo "3) Both"
read -p "Enter choice: " platform_choice

echo "🧹 Cleaning project..."
flutter clean

echo "📦 Getting dependencies..."
flutter pub get

# Extract build number from pubspec
BUILD_NUMBER=$(grep 'version:' pubspec.yaml | awk -F '+' '{print $2}')

echo "🔢 Current build number: $BUILD_NUMBER"

if [ "$platform_choice" == "1" ] || [ "$platform_choice" == "3" ]; then
  echo "🤖 Building Android ($MODE)..."
  flutter build apk --$MODE --build-number=$BUILD_NUMBER
fi

if [ "$platform_choice" == "2" ] || [ "$platform_choice" == "3" ]; then
  echo "🍎 Building iOS ($MODE)..."
  flutter build ios --$MODE --build-number=$BUILD_NUMBER
fi

echo "✅ Build completed!"