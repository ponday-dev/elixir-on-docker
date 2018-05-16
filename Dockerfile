FROM elixir:1.6.5

ENV APP_DIR /app

RUN mkdir /app
WORKDIR /app

SHELL ["/bin/bash", "-lc"]

RUN yes | mix local.hex
RUN yes | mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
RUN mix local.rebar --force

RUN apt-get update
RUN apt-get install -y curl git
RUN apt-get install -y mysql-client inotify-tools

RUN git clone git://github.com/riywo/ndenv ~/.ndenv
RUN git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build
RUN echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(ndenv init -)"' >> ~/.bash_profile
RUN source ~/.bash_profile && ndenv install 10.1.0 && ndenv global 10.1.0

