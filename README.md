# ruby-jekyll-docker

A Dockerfile for building a Jekyll image to use in development.

## Usage

The `Dockerfile.dev` file is used for development only. Build a custom production image when needed.

Build the image with:

```bash
docker build -t jekyll-toolbox -f Dockerfile.dev .
```

Run the container with commands appended, e.g., to generate a new Jekyll project. In this example, we mount the current directory into the container.

```bash
docker run --rm -it -v $PWD:/app jekyll-toolbox jekyll new ./
```

Or run interactively to run other commands.

```bash
docker run --rm -it -v $PWD:/app -p 4000:4000 jekyll-toolbox
```

If you want to include a local gem cache to save time and bandwidth between runs, you can set the `GEM_HOME` variable to a folder that you will mount and persist locally. Keep in mind that this will overwrite the built-in `GEM_HOME`, so `bundler` might need to update itself if the version does not match:

```bash
docker run --rm -it -v $PWD:/app -e GEM_HOME=/app/.gems-cache jekyll-toolbox bundle install
```

The container will run as root by default. It is recommended to set your user and group ID at runtime with `--user $(id -u):$(id -g)`:

```bash
docker run --rm -it -v $PWD:/app -e GEM_HOME=/app/.gems-cache --user $(id -u):$(id -g) jekyll-toolbox bundle install
```