#!/bin/sh

cd "$(dirname $0)"

# Get the latest and greatest
echo "› brew update"
brew update

# Run Homebrew through the Brewfile
echo "› brew bundle"
brew bundle

# Cleanup
echo "› brew cleanup"
brew cleanup
