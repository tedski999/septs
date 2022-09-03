FROM alpine:latest
EXPOSE 1194/udp
RUN apk add --no-cache openvpn
COPY server.conf /etc/openvpn/server.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
