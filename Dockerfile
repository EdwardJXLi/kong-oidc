FROM kong:3.9.1-ubuntu

USER root

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    luarocks \
    && rm -rf /var/lib/apt/lists/*

# Install kong-oidc plugin globally
RUN luarocks install kong-oidc

USER kong