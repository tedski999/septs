FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY startproxy /bin/
RUN chmod +x /bin/startproxy
ENTRYPOINT ["/bin/startproxy"]
