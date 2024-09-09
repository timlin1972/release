#!/bin/bash

cd ..
cd center
git fetch
git pull --rebase

cd ..
cd common
git fetch
git pull --rebase

cd ..
cd tln_devinfo
git fetch
git pull --rebase

cd ..
cd tln_mqtt
git fetch
git pull --rebase

cd ..
cd tln_sysinfo
git fetch
git pull --rebase
