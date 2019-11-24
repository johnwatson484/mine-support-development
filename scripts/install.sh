#!/usr/bin/env sh

# Clone repositories managed by this project into `./services/`.

set -e
projectRoot=$(a="/$0"; a=${a%/*}; a=${a:-.}; a=${a#/}/; cd "$a/.." || return; pwd)

(
  cd "${projectRoot}/services"

  printf "\nCloning repositories\n"

  test -d mine-support-web \
    && >&2 echo "The 'mine-support-web' directory already exists. Skipping." \
    || git clone https://github.com/johnwatson484/mine-support-web.git
  test -d mine-support-claim-service \
    && >&2 echo "The 'mine-support-claim-service' directory already exists. Skipping." \
    || git clone https://github.com/johnwatson484/mine-support-claim-service.git

  cd "${projectRoot}"
)
