FROM alpine
RUN apk add --no-cache jq curl
COPY startddns /bin/
RUN chmod +x /bin/startddns
ENTRYPOINT ["/bin/startddns"]
