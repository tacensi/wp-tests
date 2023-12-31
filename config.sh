#!/usr/bin/env bash

# load env data
if [ -f .env ]
then
  export $(cat .env | xargs)
fi

# is the container running?
if [ ! "$(docker ps -a -q -f name=${SLUG}_wp -f status=running)" ]; then
  docker-compose up -d
else
  echo "already running"
fi

docker exec wp-teste_wp wp core install --url=${URL} --title="${TITLE}" --admin_user=${ADMIN_USER} --admin_email=${ADMIN_EMAIL} --admin_password=${ADMIN_PASSWORD}

docker exec ${SLUG}_wp wp package install yoast/wp-cli-faker
docker exec ${SLUG}_wp wp faker core content
docker exec ${SLUG}_wp wp scaffold plugin-tests ${SLUG}
