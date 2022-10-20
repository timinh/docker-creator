#!/bin/bash -e
export $(cat public/.env) &&  envsubst < public/docker-compose-prod.yml > public/docker-compose.yml