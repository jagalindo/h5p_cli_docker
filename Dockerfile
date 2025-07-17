FROM node:18-slim
LABEL maintainer="Your Name <you@example.com>"

# Install H5P CLI globally
RUN npm install -g h5p-cli \
    && apt-get update \
    && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*

# Pre-install all H5P libraries so users can work offline
RUN mkdir -p /usr/local/lib/h5p \
    && cd /usr/local/lib/h5p \
    && h5p core --yes \
    && h5p list | awk '/^h5p/ {print $1}' | \
        xargs -I{} sh -c 'h5p setup "$1" --yes || h5p setup "$1" master --yes || h5p setup "$1" main --yes' _ {}

# Set default workdir
WORKDIR /data

CMD ["bash"]
