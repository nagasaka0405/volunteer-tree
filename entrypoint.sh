#!/bin/bash
set -e

# 本番起動時だけ migrate を実行
if [ "$RENDER" = "true" ]; then
  echo "Running migrations..."
  bundle exec rails db:migrate
fi

echo "Starting server..."
bundle exec rails server -p ${PORT:-3000} -e production