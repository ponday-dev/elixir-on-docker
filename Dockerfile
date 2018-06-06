FROM elixir:1.6.5-slim

ENV APP_DIR /app

RUN mkdir /app
WORKDIR /app

SHELL ["/bin/bash", "-lc"]

RUN yes | mix local.hex
RUN yes | mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
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
