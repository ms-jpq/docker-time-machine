#!/usr/bin/with-contenv bash

set -eu
set -o pipefail


useradd  -U -u 6006    "$SMB_USER"
usermod  -o -u "$PUID" "$SMB_USER"
groupmod -o -g "$PGID" "$SMB_USER"
printf '%s\n%s\n' "$SMB_PASSWORD" "$SMB_PASSWORD" | smbpasswd -s -a "$SMB_USER"


chown "$SMB_USER":"$SMB_USER" '/share'
