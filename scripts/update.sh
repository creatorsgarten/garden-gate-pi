#!/bin/bash -e

echo "Starting update at $(date)"
docker compose pull
docker compose up -d --remove-orphans --force-recreate
echo "Update finished at $(date)"
