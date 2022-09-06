FROM certbot/dns-cloudflare:arm64v8-latest
COPY startssl /bin/
RUN chmod +x /bin/startssl
ENTRYPOINT ["/bin/startssl"]
