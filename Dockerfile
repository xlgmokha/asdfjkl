FROM ubuntu:bionic
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
RUN apt-get update -q && apt-get install -y \
  autoconf \
  bison \
  build-essential \
  curl \
  gettext \
  git \
  gnupg2 \
  gpg \
  jq \
  libcurl4 \
  libcurl4-openssl-dev \
  libedit-dev \
  libicu-dev \
  libjpeg-dev \
  liblttng-ctl-dev \
  liblttng-ctl0 \
  libmysqlclient-dev \
  libonig-dev \
  libpng-dev \
  libpq-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libxml2-dev \
  locales \
  openssl \
  re2c \
  pkg-config \
  software-properties-common \
  unzip \
  wget \
  zlib1g \
  zlib1g-dev
RUN locale-gen en_US.UTF-8
ENV PATH="${PATH}:/root/.asdf/shims:/root/.asdf/bin"
ENV TERM="xterm"
RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf && \
  echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc && \
  echo '. $HOME/.asdf/asdf.sh' >> $HOME/.profile && \
  echo 'legacy_version_file = yes' >> $HOME/.tool-versions && \
  asdf plugin-add dotnet-core && \
  asdf plugin-add golang && \
  asdf plugin-add java && \
  asdf plugin-add maven && \
  asdf plugin-add nodejs && \
  asdf plugin-add php && \
  asdf plugin-add python && \
  asdf plugin-add ruby && \
  asdf plugin-add yarn && \
  bash $HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring
RUN asdf install golang 1.13.5
RUN asdf install java adopt-openjdk-13.0.1+9
RUN asdf install maven 3.6.3
RUN asdf install nodejs 13.3.0
RUN asdf install php 7.4.0
RUN asdf install python 2.7.17
RUN asdf install python 3.8.0
RUN asdf install ruby 2.6.5
RUN asdf install yarn 1.21.0
