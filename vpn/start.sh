#!/bin/sh

set -e

if ! [ -f dh.pem ]; then
	echo "Generating Diffie-Hellman parameters..."
	openssl dhparam -out dh.pem 2048
fi 2>/dev/null
if ! [ -f ca.key -a -f ca.crt -a -f server.key -a -f server.crt ]; then
	echo "Generating PKI certificates..."
	openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes -subj "/CN=vpn.$SERVER_DOMAIN" -keyout ca.key -out ca.crt
	openssl req -newkey rsa:4096 -nodes -subj "/CN=vpn.$SERVER_DOMAIN" -keyout server.key |
		openssl x509 -req -days 3650 -sha256 -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt
fi 2>/dev/null

echo "Starting VPN server..."
exec openvpn --config server.conf
