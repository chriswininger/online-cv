#!/usr/bin/env bash

# build an image based on the current state of the file system
./docker-build_image.sh

./docker-build_static_site.sh
