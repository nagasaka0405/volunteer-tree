#!/bin/bash
set -e

echo "Preparing database..."
bundle exec rails db:prepare
bundle exec rails db:seed

echo "Starting server..."
bundle exec rails server -p ${PORT:-3000} -e production