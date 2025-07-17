FROM node:18-slim
LABEL maintainer="Your Name <you@example.com>"

# Install H5P CLI globally

RUN npm install -g h5p-cli

# Pre-install all H5P libraries so users can work offline
RUN mkdir -p /usr/local/lib/h5p \
    && cd /usr/local/lib/h5p \
    && h5p core --yes \
    && h5p list | awk '/^h5p/ {print $1}' | xargs -n1 -I{} h5p setup {} --yes


# Set default workdir
WORKDIR /data

CMD ["bash"]
