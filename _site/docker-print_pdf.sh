#!/bin/bash

pdf_host_volume_dir="$(pwd)/assets/documents"

mv "$pdf_host_volume_dir/resume.pdf" "$pdf_host_volume_dir/resume.bk.$(date "+%Y-%m-%d-%H-%M-%S").pdf"
docker run --rm --name online-cv -p 4000:4000 -v "$pdf_host_volume_dir:/pdf-output" online-cv print-pdf

echo "sudo required to fix perission on file dumped by docker"
sudo chown "$USER:$USER" "$pdf_host_volume_dir/resume.pdf"

