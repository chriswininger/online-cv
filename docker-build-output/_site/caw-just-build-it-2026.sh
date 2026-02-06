set -e
./docker-build_image_and_build_site.sh
sudo chown chris:chris -R ./
./overwrite_pdf.sh ~/Nextcloud/chris-wininger-resume-2026-feb-websafe.pdf
