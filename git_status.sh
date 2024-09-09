#!/bin/bash

cd $(dirname $0)

source ./color.sh

cd ..
for PACKAGE in ./*/
do
    echo -e "Processing folder: ${BLUE}${PACKAGE}${NC}"
    if [ -d "${PACKAGE}" ]; then
        cd ${PACKAGE}

        if [ $(git status | grep modified -c) -ne 0 ]
        then
            echo -e "\t${RED}Modified files: ${PACKAGE}${NC}"
        fi

        if [ $(git status | grep Untracked -c) -ne 0 ]
        then
            echo -e "\t${RED}Untracked files: ${PACKAGE}${NC}"
        fi
        
        cd ..
    fi
done
