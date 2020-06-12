TAG=digineode/firefox-java:latest

build:
	docker build -t ${TAG} .

push: build
	docker push ${TAG}

run: build
	docker run -ti --rm -e DISPLAY=:0 \
		--volume $XAUTHORITY:/home/surfer/.Xauthority \
		--volume /tmp/.X11-unix:/tmp/.X11-unix \
		${TAG}
