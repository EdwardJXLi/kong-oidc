FROM kong:3.9.1-ubuntu

USER root

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    luarocks \
    && rm -rf /var/lib/apt/lists/*

# Create necessary directories for kong user
RUN mkdir -p /home/kong/.luarocks /home/kong/.cache && \
    chown -R kong:kong /home/kong/.luarocks /home/kong/.cache

USER kong

# Install kong-oidc and force dependency updates
RUN luarocks install --local kong-oidc && \
    luarocks install --local --force lua-resty-openidc 1.8.0-1