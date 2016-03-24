
FROM fedora:22

RUN dnf update -y && \
        dnf install -y firefox

RUN groupadd --gid 1000 user && \
        useradd --uid 1000 --gid 1000 --create-home user

USER user
CMD /usr/bin/firefox
