FROM ubuntu:20.04
LABEL maintainer="nova@wittamit.co.uk"

ARG BUILD_DATE
ARG TIMEZONE

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.build-date="$BUILD_DATE"
LABEL org.label-schema.name="wittamit/2ddevenv"
LABEL org.label-schema.description="2D Game Development environment, with Simple2D and build tools"
LABEL org.label-schema.url="https://github.com/Not-Super-Nova/2ddevenv"
LABEL org.label-schema.vcs-url="https://github.com/Not-Super-Nova/2ddevenv"

COPY simple2d.sh installers/simple2d.sh

RUN echo $TIMEZONE > /etc/timezone && \
ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && \
apt update && \
apt -y dist-upgrade && \
apt -y install build-essential wget sudo unzip && \
yes | /installers/simple2d.sh install
CMD /bin/bash
