#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# pg connection uri
pg_uri="postgres://$DB_USER:$DB_PASS@$DB_HOST:$DB_PORT/shield"

# make sure pg is ready to accept connections
until pg_isready -h $DB_HOST -p $DB_PORT -U $DB_USER
do
  echo "Waiting for postgres at: $pg_uri"
  sleep 5;
done

CHECK_DB=$(PGPASSWORD=$DB_PASSWORD psql postgres -h $DB_HOST -U $DB_USER -tAc "SELECT 1 FROM pg_database WHERE datname='$DB_NAME'")
if [ "$CHECK_DB" == "1" ] && [ "$DATABASE_DUMP_VALUE" != "true" ]; then
  echo "we have db"
else
  bin/bash -c 'bundle exec rails db:setup; exit 0'
fi

/bin/bash -c 'bundle exec rails db:migrate; exit 0'
/bin/bash -c 'bundle exec rails db:seed; exit 0'

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
