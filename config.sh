#!/usr/bin/env bash

if [ -f .env ]
then
  export $(cat .env | xargs)
fi

#docker exec -i ${SLUG}_wp wp scaffold plugin-tests $SLUG --force
#docker exec --workdir /var/www/html/wp-content/plugins/${SLUG} -i ${SLUG}_wp composer install
#docker exec --workdir /var/www/html/wp-content/plugins/${SLUG}  -i ${SLUG}_wp bin/install-wp-tests.sh ${DB_NAME}_test root $DB_ROOT_PASSWORD ${SLUG}_mysql latest
#docker exec --workdir /var/www/html/wp-content/plugins/${SLUG}  -i ${SLUG}_wp vendor/bin/phpunit --migrate-configuration
docker exec --workdir /var/www/html/wp-content/plugins/${SLUG}  -i ${SLUG}_wp vendor/bin/phpunit --colors=always
#docker exec --workdir /var/www/html/wp-content/plugins/${SLUG}  -i ${SLUG}_wp install-wp-tests.sh ${DB_NAME}_test root $DB_ROOT_PASSWORD ${SLUG}_mysql latest

