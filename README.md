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
docker run -it jagalindo/h5p-cli h5p
```

All available H5P libraries are downloaded during the Docker build and the
`h5p-course-presentation` library is set up ahead of time. This means commands
like `h5p setup h5p-course-presentation` simply copy the local files instead of
downloading anything.


### Example workflow

```bash
mkdir my_first_h5p_environment
cd my_first_h5p_environment
h5p core
h5p setup h5p-course-presentation
```

You can use `h5p list` to see which content libraries are available and set them
up in the same way.

## Pre-installed libraries
All libraries fetched during the image build are stored in `/usr/local/lib/h5p` inside the container. When mounting a directory for your project, you can copy or symlink these libraries so the `h5p` command can use them immediately.

To copy the libraries into a mounted directory:

```bash
docker run --rm -v $(pwd)/my_h5p_data:/data jagalindo/h5p-cli bash -c 'cp -r /usr/local/lib/h5p/* /data/'
```

Or create symbolic links instead:

```bash
docker run --rm -v $(pwd)/my_h5p_data:/data jagalindo/h5p-cli bash -c 'for d in /usr/local/lib/h5p/*; do ln -s "$d" /data/; done'
```


## Automation
The workflow defined in `.github/workflows/docker-image.yml` builds the image and pushes it to Docker Hub on the first day of every month. You can also trigger the workflow manually from the GitHub Actions tab.

