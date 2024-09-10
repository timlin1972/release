#!/bin/bash

source ./packages.sh

for package in "${packages[@]}"; do
    cd ..
    cd "$package"
    git fetch
    git pull --rebase
done
