FROM python:3.8-slim
MAINTAINER Craig Weber <crgwbr@gmail.com>

ENV PYPISERVER_VERSION='1.3.1'
RUN pip install --no-cache-dir -U "pypiserver[passlib,cache]==$PYPISERVER_VERSION" && \
    mkdir -p /srv/pypi

EXPOSE 8000
VOLUME ["/srv/pypi"]

ADD run.sh /
CMD ["./run.sh"]
