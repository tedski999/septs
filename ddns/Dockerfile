FROM alpine
RUN apk add --no-cache jq curl
COPY start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
