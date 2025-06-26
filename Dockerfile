FROM kong:3.9-ubuntu

USER root

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    luarocks \
    && rm -rf /var/lib/apt/lists/*

# Clear luarocks cache and install kong-oidc plugin directly from GitHub
RUN rm -rf /var/cache/luarocks/* && \
    luarocks install https://github.com/nokia/kong-oidc/raw/master/kong-oidc-1.3.0-1.rockspec

USER kong