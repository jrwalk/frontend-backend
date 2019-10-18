# base image builds packages with compiled dependencies
FROM python:3.7.4-slim as base
RUN \
    BUILD_DEPS="gcc" \
    && apt-get update \
    && apt-get install -y $BUILD_DEPS \
    && rm -rf /var/lib/apt/lists/*
COPY requirements.txt /opt/app/requirements.txt
COPY requirements.dev.txt /opt/app/requirements-dev.txt
RUN pip install --user -r /opt/app/requirements.txt
RUN pip install --user -r /opt/app/requirements-dev.txt

# pull over built wheels and set up running environment
FROM python:3.7.4-slim as app
COPY --from=base /root/.local /root/.local
ENV PATH=/root/.local/bin/:$PATH
WORKDIR /opt/app
