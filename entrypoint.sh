#!/bin/bash
set -e

echo "Running migrations and seeds..."
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:seed

echo "Starting server..."
bundle exec rails server -p ${PORT:-3000} -e production