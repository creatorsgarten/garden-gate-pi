#!/bin/bash

while true
do
  if [ -e ota-updater/data/trigger ]
  then
    rm ota-updater/data/trigger
    echo "Update requested at $(date)"
    (sudo -u garten ./scripts/update.sh) >> ota-updater/data/log 2>&1
    echo "Update finished at $(date)"
  fi
  sleep 30
done