#!/bin/bash
source .env

echo "Run $DOCKERPROJECT Cluster"
docker compose -f compose.yml -p $DOCKERPROJECT up  -d --remove-orphans	
