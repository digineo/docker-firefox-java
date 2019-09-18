build:
	docker build -t firefox52esr .

run:
	docker run -ti --rm -e DISPLAY=:0 \
		--volume $XAUTHORITY:/home/surfer/.Xauthority \
		--volume /tmp/.X11-unix:/tmp/.X11-unix \
		firefox52esr:latest
