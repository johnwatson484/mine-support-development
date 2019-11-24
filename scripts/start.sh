#!/usr/bin/env sh
if [ -z "$(docker network ls --filter name=^mine-support$ --format={{.Name}})" ]; then
  echo "Creating mine-support network."
  docker network create mine-support
fi

set -e
projectRoot="$(a="/$0"; a=${a%/*}; a=${a:-.}; a=${a#/}/; cd "$a/.." || return; pwd)"

(
  cd "${projectRoot}"

  docker-compose -f ./services/mine-support-web/docker-compose.yaml 
                 -f ./services/mine-support-web/docker-compose.message.yaml 
                 -f ./services/mine-support-claim-service/docker-compose.yaml 
                 -f ./services/mine-support-claim-service/docker-compose.message.yaml
                 up --force-recreate $@
)
