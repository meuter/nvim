PROJECT = user

DOCKER_BUILD_TAG = \
	$(shell id -un)/$(PROJECT)

DOCKER_BUILD_ARGS = \
	--build-arg USER_ID=$(shell id -u) \
	--build-arg USER_NAME=$(shell id -un) \
	--build-arg GROUP_ID=$(shell id -g) \
	--build-arg GROUP_NAME=$(shell id -gn) \
	--progress plain \
	-t $(DOCKER_BUILD_TAG)

# priviledge to be able to test debugging...
DOCKER_RUN_NON_INTERACTIVE_ARGS = \
	--rm \
	--privileged --cap-add=SYS_PTRACE \
	--security-opt seccomp=unconfined \
	-h $(PROJECT) \
	$(DOCKER_BUILD_TAG)

DOCKER_RUN_INTERACTIVE_ARGS = \
	-ti $(DOCKER_RUN_NON_INTERACTIVE_ARGS)

SOURCE = $(shell find lua -type f | sort) \
		 $(shell find samples -type f | sort) \
		 init.lua

default: build/packer_lock.lua

build:
	mkdir -p $@

build/container: Dockerfile $(SOURCE) build
	docker build . $(DOCKER_BUILD_ARGS) -f $<
	touch $@

build/packer_lock.lua: build/container
	docker run $(DOCKER_RUN_NON_INTERACTIVE_ARGS) /bin/bash -c "nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerUpdate --nolockfile' && cat ~/.config/nvim/lua/user/packer_lock.lua" > $@

test: build/container
	docker run $(DOCKER_RUN_INTERACTIVE_ARGS) nvim

shell: build/container
	docker run $(DOCKER_RUN_INTERACTIVE_ARGS) /bin/bash

lock: build/packer_lock.lua
	cp -v $< lua/user/packer_lock.lua

clean:
	rm -rf build

install:
	$(RM) -rf ~/.local/share/nvim/lazy
	$(RM) -rf ~/.local/state/nvim/lazy
	nvim --headless "+Lazy! sync" +qa
	# git checkout lazy-lock.json
	# nvim --headless "+Lazy! restore" +qa

.PHONY: clean shell test default
