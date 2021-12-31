#!/bin/bash

docker run --rm --name online-cv -p 4000:4000 -v /home/chris/online-cv-pdf-output:/pdf-output online-cv serve

