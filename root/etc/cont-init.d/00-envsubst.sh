#!/usr/bin/with-contenv bash

set -eu
set -o pipefail


sub() {
  local envs="$1"
  local path="$2"
  local temp="$(envsubst "$envs" < "$path")"
  printf '%s' "$temp" > "$path"
}

export HOST_NAME="$(hostname)"

sub '${SMB_USER},${SMB_NAME}' /etc/samba/smb.conf
