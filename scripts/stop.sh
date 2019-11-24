#!/usr/bin/env sh
docker-compose \
-f ./services/mine-support-web/docker-compose.yaml \
-f ./services/mine-support-web/docker-compose.message.yaml \
-f ./services/mine-support-claim-service/docker-compose.yaml \
down -v $@
