# Set the base image.
FROM ubuntu:22.04

# Define arguments for the Acestream version and its SHA256 hash.
ARG ACESTREAM_FILE=acestream_3.2.3_ubuntu_22.04_x86_64_py3.10.tar.gz

# Copy the requirements.txt file into the build context.
COPY config/requirements.txt /requirements.txt

# Install system packages and clean up in a single layer to keep the size to a minimum.
RUN set -ex && \
    apt-get update && \
    apt-get install -yq --no-install-recommends \
        ca-certificates \
        python3.10 \
        python3.10-distutils \
        net-tools \
        libpython3.10 \
        wget \
        libsqlite3-dev \
        build-essential \
        libxml2-dev \
        libxslt1-dev && \
    wget https://bootstrap.pypa.io/get-pip.py && \
    python3.10 get-pip.py && \
    pip install --no-cache-dir -r /requirements.txt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/* /tmp/* /var/tmp/* && \
    rm /requirements.txt get-pip.py

# Install Acestream.
RUN mkdir /opt/acestream
ADD $ACESTREAM_FILE /opt/acestream

# Copy Acestream configuration.

COPY config/acestream.conf /opt/acestream/acestream.conf

# Entry point for the container.

ENTRYPOINT ["/opt/acestream/start-engine", "@/opt/acestream/acestream.conf"]
