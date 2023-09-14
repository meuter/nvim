FROM ubuntu:20.04

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
    ca-certificates \
    gnupg \
    unzip \
    ripgrep \
    htop \
    fzf \
    tree \
    locales \
    bfs

# install node 18 (dockerls and sumneko_lua do not work with node 11)
ENV NODE_MAJOR=18
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list &&\
    apt-get update && sudo apt-get install nodejs -y

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

# install neovim
ENV NVIM_VERSION=0.9.2
ENV NVIM_TARBALL=nvim-linux64.tar.gz
ENV NVIM_HOME="/home/${USER_NAME}/.local/"
RUN curl -L https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/${NVIM_TARBALL} --output /tmp/${NVIM_TARBALL} && \
    mkdir -p ${NVIM_HOME} && cd ${NVIM_HOME} &&\
    tar xvf /tmp/${NVIM_TARBALL} --strip-components=1 && \
    rm -rf /tmp/${NVIM_TARBALL}
ENV PATH="${NVIM_HOME}/bin:${PATH}"

# install rust
ENV CARGO_HOME="/home/${USER_NAME}/.local/cargo"
ENV RUSTUP_HOME="/home/${USER_NAME}/.local/rustup"
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="${CARGO_HOME}/bin:${PATH}"
RUN echo 'source ~/.local/cargo/env' >> $HOME/.bashrc

# install go
ENV GOROOT="/home/${USER_NAME}/.local/go"
ENV GOPATH="/home/${USER_NAME}/.local/go/packages"
ENV PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"
ENV TARBALL="go1.18.3.linux-amd64.tar.gz"
RUN wget https://go.dev/dl/${TARBALL} && \
    tar -C ~/.local -xvf ${TARBALL} && \
    rm -rf ${TARBALL}

# prepare sample as a git repo for testing purposes
COPY --chown=${USER_NAME} samples samples
RUN git config --global user.email "${USER_NAME}@sample.com" && \
    git config --global user.name "${USER_NAME}" && \
    git config --global init.defaultBranch master && \
    cd samples && git init && git add . && git commit -am sample

# force rebuild
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" /tmp/skipcache

# copy config to container
COPY --chown=${USER_NAME} [ "init.lua", ".config/nvim/" ]
COPY --chown=${USER_NAME} [ "lua", ".config/nvim/lua" ]

# bootstrap vim
WORKDIR /home/${USER_NAME}/samples
CMD [ "nvim" ]
