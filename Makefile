NAME=go-mtqq-dev
TAG=latest
IMAGE=lowyard/$(NAME):$(TAG)
WORkSPACE=./src

all: build

build:
	docker $@ -t $(IMAGE) .

push:
	docker $@ $(IMAGE)

run:
	docker $@ -d --rm --name ${NAME} -v $(WORkSPACE):/workspace $(IMAGE) tail -f /dev/null

logs:
	docker $@ -f ${NAME}

clean: stop rm

stop:
	-docker $@ ${NAME}

rm:
	-docker $@ ${NAME}

exec:
	docker $@ -it $(NAME) /bin/bash

enter: exec

.PHONY: build run clean logs stop rm push enter exec
