FROM python:3.7.4-slim

RUN \
    BUILD_DEPS="gcc" \
    && apt-get update \
    && apt-get install -y $BUILD_DEPS \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/fastapi-test
COPY requirements.txt /opt/fastapi-test/requirements.txt
COPY requirements.dev.txt /opt/fastapi-test/requirements-dev.txt

RUN pip install -r requirements.txt
RUN pip install -r requirements-dev.txt
