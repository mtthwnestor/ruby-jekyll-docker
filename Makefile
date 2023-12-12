build:
  docker build -t jekyll-toolbox -f $$PWD/Dockerfile.dev $$PWD

publish:
  docker buildx build --push --platform linux/arm64,linux/amd64 -t mtthwnestor/jekyll-toolbox:4.3.2-3 -f $$PWD/Dockerfile.dev $$PWD