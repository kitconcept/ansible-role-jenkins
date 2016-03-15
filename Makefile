SHELL := /bin/bash
SOLR_VERSION := 4.5.1
CURRENT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: clean build

setup_osx:
	@echo "Setup OS X"
	docker-machine create --driver virtualbox jenkinsmaster
	docker-machine env jenkinsmaster
	eval $(docker-machine env jenkinsmaster)

build:
	@echo "Build"
	docker build -t jenkinsmaster .
	docker run -d -p 80:80 jenkinsmaster

clean:
	@echo "Clean"
	docker stop $$(docker ps -aq)
	docker rm $$(docker ps -aq)

ssh:
	@echo "SSH into docker image"
	docker exec -it $$(docker ps -aq) bash

test:
	@echo "Run Tests"
