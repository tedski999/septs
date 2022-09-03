FROM certbot/dns-cloudflare:arm64v8-latest
COPY start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
