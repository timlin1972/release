#!/bin/sh

while :
do
  echo "Press [CTRL+C] to stop.."
  ./release.sh
  ./align.sh
  ./clone.sh
done