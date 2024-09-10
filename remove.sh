#!/bin/bash

source ./packages.sh

cd ..
for package in "${packages[@]}"; do
    rm -rf ${package}
done
