IMAGE_NAME = hidori/semver

.PHONY: clean build rebuild run rmi

clean:
	rm -fr ./tmp

build:
	docker build -t ${IMAGE_NAME} .

rebuild:
	docker build --no-cache -t ${IMAGE_NAME} .

run:
	docker run --rm ${IMAGE_NAME} -i 1.0.0

rmi:
	docker rmi -f ${IMAGE_NAME}
