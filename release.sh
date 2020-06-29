#!/usr/bin/env bash

set -eu
set -o pipefail


cd "$(dirname "$0")" || exit 1

IMAGE='msjpq/time-machine'
docker build -f 'Dockerfile' -t "$IMAGE" .


if [[ $# -gt 1 ]]
then
  docker push "$IMAGE"
fi
