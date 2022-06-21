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
    htop \
    fzf \
    tree \
    locales \
    bfs

# install node 14 (dockerls and sumneko_lua do not work with node 11)
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install nodejs

# install neovim
RUN wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb && \
    dpkg -i nvim-linux64.deb && \
    rm -vf nvim-linux64.deb

# install clang and lldb-vscode (dap does not seem to work with the lldb packaged with 22.04)
ENV TARBALL=clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
RUN cd /tmp && wget https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/${TARBALL} && \
    cd /usr/local/ && tar xvf /tmp/${TARBALL} --strip-components=1 && \
    rm -vf /tmp/${TARBALL}

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

# install rustup
ENV CARGO_HOME="/home/${USER_NAME}/.local/cargo"
ENV RUSTUP_HOME="/home/${USER_NAME}/.local/rustup"
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/home/${USER_NAME}/.local/cargo/bin:${PATH}"
RUN echo 'source ~/.local/cargo/env' >> $HOME/.bashrc

# install stylua
RUN echo $PATH && cargo install stylua

# prepare sample as a git repo for testing purposes
COPY --chown=cme samples samples
RUN git config --global user.email "drvim@sample.com" && \
    git config --global user.name "Dr. VIM" && \
    git config --global init.defaultBranch master && \
    cd samples && git init && git add . && git commit -am sample

# force rebuild
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" /tmp/skipcache

# copy config to container
COPY --chown=cme [ "init.lua", "install.lua", "lua/", ".config/nvim/" ]
COPY --chown=cme [ "lua", ".config/nvim/lua" ]

# bootstrap vim
RUN nvim --headless -u .config/nvim/install.lua
RUN nvim --headless -c "PackerSnapshot ~/drvim.json" -c "sleep 1" -c "qa!"
WORKDIR /home/${USER_NAME}/samples
CMD [ "nvim" ]
