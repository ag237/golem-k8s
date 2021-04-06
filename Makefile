.DEFAULT_GOAL := help
.DEFAULT := help
.PHONY: all
SHELL := $(shell which bash)
IMAGE_NAME ?= golem-k8s
VERSION ?= 0.0.1

help: ## This help message
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"

build: ## Build docker image
	docker build -t $(IMAGE_NAME):$(VERSION) -f Dockerfile .

docker_run: ## Run the container locally, remove container when exit
	docker run --rm -it $(IMAGE_NAME):$(VERSION) /bin/bash