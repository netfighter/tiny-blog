#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

/bin/bash -c 'bundle exec rake db:setup; exit 0'
/bin/bash -c 'bundle exec rails db:seed; exit 0'
/bin/bash -c 'bundle exec rake db:test:prepare; exit 0'

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
