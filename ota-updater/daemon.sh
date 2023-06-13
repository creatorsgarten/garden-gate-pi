#!/bin/bash

while true
do
  if [ -e ota-updater/data/trigger ]
  then
    sudo rm ota-updater/data/trigger
    echo "Update requested at $(date)" >> ota-updater/data/log
    ./scripts/update.sh >> ota-updater/data/log 2>&1
  fi
  sleep 30
done