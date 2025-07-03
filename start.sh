#!/bin/bash

echo "Starting tmate session..."

# Launch tmate and print the connection info
tmate -S /tmp/tmate.sock new-session -d
tmate -S /tmp/tmate.sock wait tmate-ready

echo "🔗 SSH (tmate):"
tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}'

# Keep container alive so Northflank doesn’t shut it down
tail -f /dev/null
