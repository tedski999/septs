#!/bin/sh

echo "Waiting for SSL certificates..."
while [ ! "$(ls -A /etc/nginx/certs/live/site/*.pem 2>/dev/null)" ]; do
	sleep 1
done

echo "Starting nginx reverse proxy..."
exec nginx -g "daemon off;"
