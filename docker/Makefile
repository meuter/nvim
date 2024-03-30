DOCKER_TAG=meuter/nvim-config
DOCKER_HOSTNAME=devbox

build:
	docker build . \
		--build-arg USER_ID=$(shell id -u) \
		--build-arg USER_NAME=$(shell id -un) \
		--build-arg GROUP_ID=$(shell id -g) \
		--build-arg GROUP_NAME=$(shell id -gn) \
		-t $(DOCKER_TAG)

test: build
	docker run -h $(DOCKER_HOSTNAME) --rm -ti $(DOCKER_TAG)
