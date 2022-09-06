FROM alpine:latest
EXPOSE 1194/udp
RUN apk add --no-cache openvpn openssl
COPY server.conf /etc/openvpn/server.conf
COPY newclient startvpn /bin/
RUN chmod +x /bin/startvpn /bin/newclient
ENTRYPOINT ["/bin/startvpn"]
