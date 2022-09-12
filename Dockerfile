FROM python:3.9-bullseye

ARG S6_VER="3.1.2.1"
ENV TZ=America/New_York

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN DEBIAN_FRONTEND=noninteractive apt update && \
     apt install -y tar git htop iftop vim tzdata

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