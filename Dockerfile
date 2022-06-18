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
    wget \
    build-essential \
    git \
    python3 \
    python3-pip \
    python3-venv \
    python-is-python3 \
    unzip \
    ripgrep \
    npm \
    nodejs \
    htop \
    fzf \
    tree \
    locales

# install neovim
RUN wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb && \
    dpkg -i nvim-linux64.deb

# set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# create user, group and add as sudo
RUN groupadd -g ${GROUP_ID} ${GROUP_NAME}
RUN useradd -s /bin/bash -g ${GROUP_NAME} -u ${USER_ID} ${USER_NAME}
RUN echo "%${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER ${USER_NAME}
WORKDIR /home/${USER_NAME}/

# copy config to container
COPY init.lua .config/nvim/
RUN sudo chown ${USER_NAME}:${GROUP_NAME} -R ${HOME}

# bootstrap vim
ENTRYPOINT [ "/bin/bash", "-c", "nvim" ]
