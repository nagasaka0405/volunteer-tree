#!/bin/bash
set -e

echo "Starting server..."
bundle exec rails server -p ${PORT:-3000} -e production