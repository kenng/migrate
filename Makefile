IMAGE=gemnasium/migrate
DCR=docker-compose run --rm
.PHONY: clean test build release docker-build docker-push run

all: release

clean:
	rm -f migrate

test:
	$(DCR) go-test

build:
	$(DCR) go-build

buildlinux:
	GOOS=linux go build -v -o migrate	

release: test build docker-build docker-push

docker-build:
	docker build --rm -t $(IMAGE) .

docker-push:
	docker push $(IMAGE)
