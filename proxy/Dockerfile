FROM nginx:alpine
COPY start.sh /start.sh
RUN chmod +x /start.sh
COPY nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT ["/bin/sh", "-c", "/start.sh"]
