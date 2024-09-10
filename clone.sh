#!/bin/bash

source ./packages.sh

cd ..
for package in "${packages[@]}"; do
    git clone git@github.com:timlin1972/${package}.git
done
