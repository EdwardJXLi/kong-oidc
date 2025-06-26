FROM kong:3.9.1-ubuntu

USER root

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    luarocks \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Create necessary directories for kong user
RUN mkdir -p /home/kong/.luarocks /home/kong/.cache && \
    chown -R kong:kong /home/kong/.luarocks /home/kong/.cache

# Download the rockspec file
RUN curl -L -o /tmp/kong-oidc-1.1.0-0.rockspec https://raw.githubusercontent.com/nokia/kong-oidc/refs/tags/v1.1.0/kong-oidc-1.1.0-0.rockspec

USER kong

# Install from downloaded rockspec
RUN luarocks install --local /tmp/kong-oidc-1.1.0-0.rockspec