FROM alpine:latest
EXPOSE 1194/udp
WORKDIR /etc/openvpn
RUN apk add --no-cache openvpn openssl
COPY server.conf /etc/openvpn/server.conf
COPY client.conf /etc/openvpn/client.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/start.sh"]
