# Septs

Place your configuration in `./config.env`:

```
DOMAIN_NAME=exmaple.com
DOMAIN_EMAIL=admin@example.com
CF_API_TOKEN=xxx
CF_ZONE=xxx
CF_A_RECORD=xxx
CF_AAAA_RECORD=xxx
```

Create Docker Registry credentials

```
mkdir -p ./data/reg/auth
docker run --entrypoint htpasswd httpd:2 -Bbn <USERNAME> <PASSWORD> > ./data/reg/auth/htpasswd
```
