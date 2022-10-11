# Septs

The following environment variables have to be defined appropriately:
```
SUBDOMAINS=foo,bar
DOMAIN_NAME=exmaple.com
DOMAIN_EMAIL=root@example.com
CF_API_TOKEN=your_api_token
CF_ZONE=your_zone_id
CF_A_RECORD=your_a_domain_id
CF_AAAA_RECORD=your_aaaa_domain_id
```

You could put them in a `.env` file.
Then just run `docker compose up --build --detach` to start everything.
