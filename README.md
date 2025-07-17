# h5p_cli_docker

This project provides a Docker image containing the [H5P CLI](https://github.com/h5p/h5p-cli). The image is built automatically every month using GitHub Actions.

## Usage

Build the image locally:

```bash
docker build -t h5p-cli .
```

Alternatively, pull the prebuilt image from Docker Hub:

```bash
docker pull <your_dockerhub_username>/h5p-cli:latest
```

Run the container:

```bash
docker run -it h5p-cli h5p --help
```

The container includes the `h5p-course-presentation` library downloaded during
the image build. This allows you to work offline without waiting for the
dependencies to be fetched.

## Automation

The workflow defined in `.github/workflows/docker-image.yml` builds the image and pushes it to Docker Hub on the first day of every month.
