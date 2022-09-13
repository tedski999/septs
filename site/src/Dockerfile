FROM python:alpine
RUN apk add git; adduser git --disabled-password --shell /usr/bin/git-shell
COPY index.html index.html
ENTRYPOINT ["python", "-m", "http.server", "80"]
