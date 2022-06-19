PROJECT = drvim

DOCKER_BUILD_TAG = \
	$(shell id -un)/$(PROJECT)

DOCKER_BUILD_ARGS = \
	--build-arg USER_ID=$(shell id -u) \
	--build-arg USER_NAME=$(shell id -un) \
	--build-arg GROUP_ID=$(shell id -g) \
	--build-arg GROUP_NAME=$(shell id -gn) \
	--progress plain \
	-t $(DOCKER_BUILD_TAG)

DOCKER_RUN_ARGS = \
	-ti --rm \
	-h $(PROJECT) \
	$(DOCKER_BUILD_TAG)

SOURCE = $(shell find lua/drvim/ -type f | sort)

default: build/drvim.json

build:
	mkdir -p $@

build/container: Dockerfile $(SOURCE) build
	docker build . $(DOCKER_BUILD_ARGS) -f $<
	touch $@

build/drvim.json: build/container
	docker run  $(DOCKER_RUN_ARGS) /bin/bash -c "cat ~/drvim.json" > $@

test: build/container
	docker run $(DOCKER_RUN_ARGS) nvim +Neotree

shell: build/container
	docker run $(DOCKER_RUN_ARGS) /bin/bash

release: build/drvim.json
	cp -v $< lua/drvim/drvim.json

clean:
	rm -rf build

.PHONY: clean shell test default
