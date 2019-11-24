#!/usr/bin/env sh
docker-compose \
-f ../mine-support-web/docker-compose.yaml \
-f ../mine-support-web/docker-compose.message.yaml \
-f ../mine-support-claim-service/docker-compose.yaml \
-f ../mine-support-claim-service/docker-compose.message.yaml \
down -v $@
