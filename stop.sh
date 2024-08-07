#!/bin/bash
source .env

echo "Stop $DOCKERPROJECT Cluster"
docker compose -f compose.yml -p $DOCKERPROJECT stop
