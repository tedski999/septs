#!/bin/sh

if ! [ "$CLOUDFLARE_API_TOKEN" -a "$CLOUDFLARE_ZONE_ID" -a "$CLOUDFLARE_DOMAIN_ID" ]; then
	>&2 echo "Error: Missing required environment variables!"
	exit 1
fi

trap "echo 'Stopping...'; exit" 15

old_ip=""

while true; do
	new_ip="$(curl --silent ipv4.icanhazip.com)"
	if [ -n "$new_ip" ] && [ "$new_ip" != "$old_ip" ]; then
		echo "New public IP: $new_ip"
		curl --silent \
			--request PATCH "https://api.cloudflare.com/client/v4/zones/$CLOUDFLARE_ZONE_ID/dns_records/$CLOUDFLARE_DOMAIN_ID" \
			--header "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
			--header "Content-Type: application/json" \
			--data '{"content":"'"$new_ip"'"}' |
			jq --exit-status ".success" >/dev/null &&
			old_ip="$new_ip" ||
			>&2 echo "Error: Failed to update DNS record!"
	fi
	sleep 300 &
	wait $!
done
