#!/bin/sh

if [ -z "$1" ]; then
  echo "Please pass the keyboard as first argument"
  exit 1
fi
if [ -z "$2" ]; then
  echo "Please pass the keymap as second argument"
  exit 1
fi

docker build \
	-t "docker/qmk_docker" \
	-f centos_ARM/Dockerfile \
	.
	
docker tag "docker/qmk_docker" "hbaldzuhn/qmk_docker"
	
docker build \
	--build-arg keyboard=$1 \
	--build-arg keymap=$2 \
	-t "qmk-docker/keyboard_hex" \
	.

docker run --rm \
	--env DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	--privileged -v /dev:/dev \
	"qmk-docker/keyboard_hex"
