FROM debian:11-slim

WORKDIR /app
EXPOSE 4000

RUN apt-get update -y && apt-get install curl -y

# Get the latest version from GitHub Releases and leave it at /app/router
RUN /bin/sh -c '\
  CUR_VER="$(curl -s --write-out %{redirect_url} \
    -o /dev/null https://github.com/apollographql/router/releases/latest | \
  perl -lne '"'print for /v(.*)$/'"')" && \
  echo "Getting $CUR_VER" && \
  curl -sSL "https://github.com/apollographql/router/releases/download/v${CUR_VER}/router-${CUR_VER}-x86_64-linux.tar.gz" | \
  tar -xz dist/router && \
  mv dist/router ./router \
'

# Put our startup script and the base configuration in as well.
# The config.yaml can be edited, but might live better as a volume mount
# in another configuration (e.g., in Kubernetes)
COPY start.sh .
COPY config.yaml .

CMD ["./start.sh"]