# [Docker Tim🍎 Machine](https://ms-jpq.github.io/docker-time-machine)

Zero Configuration. Time machine for MacOS

Thank you Tim🍏, very cool.

## Show me

[![Docker Pulls](https://img.shields.io/docker/pulls/msjpq/time-machine.svg)](https://hub.docker.com/r/msjpq/time-machine/)

```sh
docker run --net=host -v /my_folder/:/share msjpq/time-machine
```

- User: `dog`
- Password : `dog`

Why? Because I like dogs.

## Fancy

| Environmental Variables   | Description                            |
| ------------------------- | --------------------                   |
| `SMB_NAME='Time Machine'` | what you see from 💻                   |
| `SMB_USER=dog`            | your login                             |
| `SMB_PASSWORD=dog`        | your password                          |
| `SMB_MAX_SIZE_MB=0`       | max reported share size (0 = no limit) |
| `PGID=0`                  | user gid (advanced)                    |
| `PUID=0`                  | user uid (advanced)                    |

## Docker Compose

```yaml
---
version: "3.7"

services:
  time_machine:
    image: msjpq/time-machine
    container_name: time-machine
    restart: unless-stopped
    network_mode: host
    volumes:
      - ./:/share
```

## Very important

Say hi to my dog!

![my dog](https://raw.githubusercontent.com/ms-jpq/docker-time-machine/tim-apple/preview/dog.JPG)
