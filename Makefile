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
	docker stop $$(docker ps -aq)
	docker build -t jenkinsmaster .
	docker run -d -p 8080:8080 jenkinsmaster

clean:
	@echo "Clean"
	docker stop $$(docker ps -aq)
	docker rm $$(docker ps -aq)

ssh:
	@echo "SSH into docker image"
	docker exec -it $$(docker ps -aq) bash

open_osx:
	open "http://$(docker-machine ip jenkinsmaster):80/"

test:
	@echo "Run Tests"
	pybot test.robot

test_osx:
	@echo "Run Tests"
	pybot --variable HOSTNAME:$$(docker-machine ip jenkinsmaster) test.robot

