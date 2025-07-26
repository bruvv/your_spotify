#!/bin/sh
set -e

if [ "$NODE_ENV" = "development" ]; then
  /app/apps/server/scripts/run/run_dev.sh &
  SERVER_PID=$!
  /app/apps/client/scripts/run/run_dev.sh &
  CLIENT_PID=$!
else
  /app/apps/server/scripts/run/run.sh &
  SERVER_PID=$!
  /app/apps/client/scripts/run/run.sh &
  CLIENT_PID=$!
fi

trap 'kill $SERVER_PID $CLIENT_PID' INT TERM
wait $SERVER_PID $CLIENT_PID
