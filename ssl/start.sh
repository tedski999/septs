#!/bin/sh

if ! [ "$CLOUDFLARE_API_TOKEN" -a "$SERVER_DOMAIN" -a "$SERVER_EMAIL" ]; then
	>&2 echo "Error: Missing required environment variables!"
	exit 1
fi

trap "echo 'Stopping...'; exit" 15

echo "dns_cloudflare_api_token = $CLOUDFLARE_API_TOKEN" > "/cloudflare.ini"
chmod go-rwx "/cloudflare.ini"

echo "Checking for valid SSL certificates..."
certbot renew --quiet --cert-name site
if [ $? -ne 0 ]; then
	echo "Missing valid SSL certificates, registering new domain..."
	certbot certonly \
		--dry-run \
		--non-interactive \
		--agree-tos \
		--cert-name site \
		--email "$SERVER_EMAIL" \
		--domains "$SERVER_DOMAIN,*.$SERVER_DOMAIN" \
		--dns-cloudflare \
		--dns-cloudflare-credentials "/cloudflare.ini" \
		--dns-cloudflare-propagation-seconds "60"
	if [ $? -ne 0 ]; then
		>&2 echo "Error: Failed to register domain!"
		exit 1
	fi
fi

DAY="$(shuf -i 0-6 -n 1)"
HOUR="$(shuf -i 0-23 -n 1)"
MINUTE="$(shuf -i 0-59 -n 1)"
echo "$MINUTE $HOUR * * $DAY root certbot renew --quiet --cert-name site" >> /var/spool/cron/crontabs/root

echo "Success. Checking for renewals every week at ${DAY}d ${HOUR}h ${MINUTE}m"

crond -f &
wait $!
