#!/bin/bash

which brew || exit 1

for p in $(cat install_scripts/brew_packages.txt); do
  brew install $p
done

