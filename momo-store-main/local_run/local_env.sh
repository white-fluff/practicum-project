#!/bin/bash

# About: Script fo local launch 
# Author: Konstantin Belopukhov

# Necessary environment variables for the local launch of the project
BACKEND_VERSION=latest
echo "Backend Version ${BACKEND_VERSION}"
FRONTEND_VERSION=latest
echo "Frontend Version ${FRONTEND_VERSION}"
CI_REGISTRY_USER=registry_login
CI_REGISTRY_PASSWORD=registry_pass

# Login into registry
docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD example_repo.net

# Run
docker compose up -d