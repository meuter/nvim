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
DOCKER_RUN_ARGS = \
	-ti --rm \
	--privileged --cap-add=SYS_PTRACE \
	--security-opt seccomp=unconfined \
	-h $(PROJECT) \
	$(DOCKER_BUILD_TAG)

SOURCE = $(shell find lua/user/ -type f | sort) \
		 $(shell find samples -type f | sort) \
		 init.lua install.lua

default: build/packer_lock.json

build:
	mkdir -p $@

build/container: Dockerfile $(SOURCE) build
	docker build . $(DOCKER_BUILD_ARGS) -f $<
	touch $@

build/packer_lock.json: build/container
	docker run  $(DOCKER_RUN_ARGS) /bin/bash -c "cat ~/packer_lock.json" > $@

test: build/container
	docker run $(DOCKER_RUN_ARGS) nvim

shell: build/container
	docker run $(DOCKER_RUN_ARGS) /bin/bash

release: build/packer_lock.json
	cp -v $< lua/user/packer_lock.json

clean:
	rm -rf build

.PHONY: clean shell test default
