# firefox-docker

There are a few different options to run GUI applications inside a Docker container like using SSH with X11 forwarding, or VNC but the simplest one that I figured out was to share my X11 socket with the container and use it directly.

The idea is pretty simple and you can easily it give a try by running a Firefox container using the following Dockerfile as a starting point:

*Dockerfile (Fedora23)
	
	FROM fedora:23

	RUN dnf update -y && \
        dnf install -y firefox

	RUN groupadd --gid 1000 user && \
        useradd --uid 1000 --gid 1000 --create-home user

	USER user
	CMD /usr/bin/firefox
*Build Docker
	docker build -t firefox .
*Adding X11 Host
	xhost +local:
*Running Docker Container
	sudo docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix firefox

If all goes well you should see Firefox running from within a Docker container.
