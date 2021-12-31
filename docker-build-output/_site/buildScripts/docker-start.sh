#!/bin/bash

command=$1

function ctrl_c() {
        echo "exiting container due to user termination"
        exit 0
}

wait_for_server() {
  echo "waiting for server"

  until curl -s -f -o /dev/null "http://0.0.0.0:4000"
  do
      sleep 1
    done

  echo 'server ready'
}

spawn_jekyll_server_in_background() {
  echo "starting jekyll server"

  if [ $1 = "print-version" ]; then
    JEKYLL_ENV=print-version jekyll serve --host 0.0.0.0&
  else
    jekyll serve --host 0.0.0.0&
  fi
}

print_command() {
  echo "performing $command command"
}

update_pdf() {
    echo "starting server in pdf mode"

    spawn_jekyll_server_in_background "print-version"

    wait_for_server

    echo "updating pdf"
    OPENSSL_CONF=/dev/null phantomjs ./buildScripts/phantomLoader.js
    cp ./resume.pdf /pdf-output/
    cp ./resume.pdf ./assets/documents/
}

pushd /online-cv || exit

# SERVER SITE LOCAL FOR DEBUGGING
if [ "$command" = "serve" ]; then
  print_command

  spawn_jekyll_server_in_background "web-version"

  # work around to allow docker to get cttrl-c and exit (if we just run jekyll, even in foreground it does not get ctrl-c passed)
  trap ctrl_c INT
  while true; do
    sleep 1
  done

# PRINT PDF
elif [ "$command" = "print-pdf" ]; then
  print_command

  update_pdf

# BUILD static site to _site
elif [ "$command" = "build" ]; then
    # make sure the pdf is up to date
    update_pdf

    jekyll build
    cp -r ./_site /build-output

# COMMAND NOT FOUND
else
  echo "command '$1' not found"
  echo "   options serve, print-pdf"
  exit 1
fi
