FROM elixir:latest
MAINTAINER iekechukwu@gmail.com

RUN apt-get update

RUN apt-get update && apt-get install -y \
  build-essential
  libpq-dev

