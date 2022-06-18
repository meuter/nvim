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

default: run

build: Dockerfile
	docker build . $(DOCKER_BUILD_ARGS) -f $<

run: build
	docker run $(DOCKER_RUN_ARGS)
