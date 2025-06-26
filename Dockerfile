FROM kong:3.9.1-ubuntu

USER root

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    luarocks \
    && rm -rf /var/lib/apt/lists/*

# Clear luarocks cache and install kong-oidc plugin directly from GitHub
RUN rm -rf /var/cache/luarocks/* && \
    luarocks install https://raw.githubusercontent.com/nokia/kong-oidc/refs/tags/v1.1.0/kong-oidc-1.1.0-0.rockspec

USER kong