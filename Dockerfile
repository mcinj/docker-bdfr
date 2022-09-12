FROM python:3.9-bullseye

ENV TZ=America/New_York
ARG S6_VER="3.1.2.1"

RUN  apt update && \
     apt install -y tar git htop iftop vim

RUN pip3 install git+https://github.com/aliparlakci/bulk-downloader-for-reddit.git@development

ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_VER}/s6-overlay-noarch.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_VER}/s6-overlay-x86_64.tar.xz /tmp
RUN tar -C / -Jxpf /tmp/s6-overlay-x86_64.tar.xz

COPY ./etc/ /etc/
RUN mkdir /app
COPY ./app/ /app/
RUN chmod +x /app/runner.sh

VOLUME /config
VOLUME /downloads
ENTRYPOINT ["/init"]