#!/bin/bash

# on mac add --platform linux/amd64
docker run \
  --rm \
  --name online-cv \
  -p 4000:4000 \
  -v "$(pwd)/online-cv-pdf-output:/pdf-output" \
  -v "$(pwd)/docker-build-output:/build-output" \
  online-cv build
