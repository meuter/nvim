FROM ubuntu:22.04

# build arguments
ARG USER_ID
ARG USER_NAME
ARG GROUP_ID
ARG GROUP_NAME

# install dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install --no-install-recommends \
    sudo \
    curl \
    build-essential \
    git \
    python3 \
    python3-venv \
    ca-certificates \
    zip \
    locales \
    unzip

# set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# create user, group and add as sudo
RUN groupadd -g ${GROUP_ID} ${GROUP_NAME}
RUN useradd -s /bin/bash -g ${GROUP_NAME} -u ${USER_ID} ${USER_NAME}
USER ${USER_NAME}
WORKDIR /home/${USER_NAME}/

# download dotfiles and install all necessary building blocks
# including neovim config
RUN curl -s https://raw.githubusercontent.com/meuter/dotfiles/main/install.sh | bash -s -- \
    shell-essential \
    neovim \
    neovim-config
