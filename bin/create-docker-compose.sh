#!/bin/bash -e
export $(cat public/.env) &&  envsubst < public/docker-compose.yml > public/docker-compose.production.yml
echo "docker-compose.production.yml généré"