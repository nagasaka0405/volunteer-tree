#!/bin/bash
set -e

echo "Running migrations..."
bundle exec rails db:migrate

echo "Starting server..."
bundle exec rails server -p ${PORT:-3000} -e production