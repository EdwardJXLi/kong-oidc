FROM kong:3.4-ubuntu

USER root

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    luarocks \
    && rm -rf /var/lib/apt/lists/*

# Install Nokia's kong-oidc plugin
RUN luarocks install kong-oidc

USER kong