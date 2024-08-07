IMAGE_NAME = hidori/semver

.PHONY: build
build:
	docker build -t ${IMAGE_NAME} .

.PHONY: rebuild
rebuild:
	docker build --no-cache -t ${IMAGE_NAME} .

.PHONY: run
run:
	docker run --rm ${IMAGE_NAME} -i 1.0.0

.PHONY: rmi
rmi:
	docker rmi -f ${IMAGE_NAME}

.PHONY: version
version:
	git checkout main
	git fetch
	git pull
	git tag `jq -r '.dependencies.semver' ./package.json | sed 's/[^0-9.]//'`
	git push --tags
