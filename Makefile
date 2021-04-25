IMAGE_TAG = siwb-project
DOCKER_FILE = binderignore.Dockerfile

build:
	docker build -t $(IMAGE_TAG) -f $(DOCKER_FILE) .

run:
	docker run --rm -it -p=8888:8888 -v=`pwd`:/usr/src/app $(IMAGE_TAG)
