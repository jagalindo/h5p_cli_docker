FROM node:18-slim
LABEL maintainer="Your Name <you@example.com>"

# Install H5P CLI globally
RUN npm install -g h5p h5p-cli

# Pre-install common H5P library so users don't need to download it later
RUN h5p setup h5p-course-presentation

# Set default workdir
WORKDIR /data

CMD ["bash"]
