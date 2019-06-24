#!/usr/bin/env bash

set -o errexit # causes script to exit immediately when a command fails
set -o pipefail # causes pipe to fail if any command in the pipeline fails

envoyid=$(docker container ls --filter "name=hello-world_envoy" -q --latest)
dartserverid=$(docker container ls --filter "name=hello-world_dart-server" -q --latest)

# Remove old containers, if they're there
[ ! -z "$envoyid" ] && docker container rm -f $envoyid
[ ! -z "$dartserverid" ] && docker container rm -f $dartserverid

# Remove all containers
# docker container rm -f $(docker container ls -a -q)

# Start up envoy proxy in the background
docker-compose run -d --service-ports --use-aliases envoy

# Start up dart server interactively
docker-compose run --service-ports --use-aliases dart-server /bin/bash

# cd client
# webdev serve web:9000
# or 
# pub run build_runner serve web:9000
# 