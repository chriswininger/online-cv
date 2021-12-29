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
  jekyll serve --host 0.0.0.0&
}

print_command() {
  echo "performing $command command"
}

pushd /online-cv || exit

if [ $1 = "serve" ]; then
  print_command

  spawn_jekyll_server_in_background

  # work around to allow docker to get cttrl-c and exit (if we just run jekyll, even in foreground it does not get ctrl-c passed)
  trap ctrl_c INT
  while true; do
    sleep 1
  done
elif [ $1 = "print-pdf" ]; then
  print_command

  export JEKYLL_ENV=print-version
  spawn_jekyll_server_in_background

  wait_for_server

  OPENSSL_CONF=/dev/null phantomjs ./buildScripts/phantomLoader.js
  cp ./resume.pdf /pdf-output/
else
  echo "command '$1' not found"
  echo "   options serve, print-pdf"
  exit 1
fi
