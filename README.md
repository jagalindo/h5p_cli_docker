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

All available H5P libraries are downloaded when the image is built. This allows
you to run `h5p setup <library>` later without an internet connection.

### Example workflow

```bash
mkdir my_first_h5p_environment
cd my_first_h5p_environment
h5p core
h5p setup h5p-course-presentation
```

You can use `h5p list` to see which content libraries are available and set them
up in the same way.

## Automation

The workflow defined in `.github/workflows/docker-image.yml` builds the image and pushes it to Docker Hub on the first day of every month. You can also trigger the workflow manually from the GitHub Actions tab.

