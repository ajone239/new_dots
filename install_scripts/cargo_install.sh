#!/bin/bash

which cargo || exit 1

for p in $(cat install_scripts/cargo_packages.txt); do
  cargo install $p
done

