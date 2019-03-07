FROM elixir:1.8.1-slim

ENV APP_DIR /app

RUN mkdir /app
WORKDIR /app

SHELL ["/bin/bash", "-lc"]

RUN yes | mix local.hex
RUN yes | mix archive.install hex phx_new 1.4.1
RUN mix local.rebar --force

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
    curl \
    git \
    gnupg1 \
    gnupg2 \
    mysql-client \
    inotify-tools 
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN apt-get clean

