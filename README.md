# Septs

The following environment variables have to be defined appropriately:
```
SERVER_DOMAIN=exmaple.com
SERVER_EMAIL=root@example.com
SERVER_PRIVATE_IP=192.168.0.1
CLOUDFLARE_API_TOKEN=your_api_token
CLOUDFLARE_ZONE_ID=your_zone_id
CLOUDFLARE_DOMAIN_ID=your_domain_id
```

Then just run `docker compose up --build --detach` to start everything.

TODO: vpn, git server, root website, git website, dns server
