build:
	docker build -t crgwbr/docker-pypi:latest .

run:
	mkdir -p ./_data && \
	touch ./_data/.htaccess && \
	docker run -d --rm \
		-h pypi.local \
		-v $(pwd)/_data:/srv/pypi:rw \
		-p 8000:8000 \
		--name pypi \
		crgwbr/docker-pypi:latest

clean:
	docker rmi $(docker images -q crgwbr/docker-pypi)
