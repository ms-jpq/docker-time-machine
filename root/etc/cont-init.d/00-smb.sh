#!/usr/bin/with-contenv bash

set -eu
set -o pipefail


GROUP_NAME='time-machine-users'

groupadd --non-unique --gid "$PGID" "$GROUP_NAME"
useradd --system --non-unique --gid "$GROUP_NAME" --uid "$PUID" "$SMB_USER"


printf '%s\n%s\n' "$SMB_PASSWORD" "$SMB_PASSWORD" | smbpasswd -s -a "$SMB_USER"


chown "$SMB_USER":"$GROUP_NAME" '/share'
