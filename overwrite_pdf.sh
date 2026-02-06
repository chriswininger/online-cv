#!/bin/bash

# A simple utility for replacing the generated PDF before publishing
cp "$1" ./_site/assets/documents/resume.pdf
cp "$1" ./docker-build-output/_site/resume.pdf
cp "$1" ./docker-build-output/_site/assets/documents/resume.pdf
cp "$1" ./assets/documents/resume.pdf
