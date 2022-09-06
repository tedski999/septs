# Septs

The following environment variables have to be defined appropriately:
```
SRV_DOMAIN=exmaple.com
SRV_EMAIL=root@example.com
CF_API_TOKEN=your_api_token
CF_ZONE=your_zone_id
CF_A_RECORD=your_a_domain_id
CF_AAAA_RECORD=your_aaaa_domain_id
```

You could put them in a `.env` file.
Then just run `docker compose up --build --detach` to start everything.

TODO: refine proxy, refine vpn configs, git server, root website, git website, onion service
