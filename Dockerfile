FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04

# Avoid prompts from apt
ENV PATH="/usr/local/cuda/bin:$PATH" \
    LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH" \
    DEBIAN_FRONTEND=noninteractive


# Install python3.8 and pip
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    python3.8 \
    python3.8-distutils \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set Python3.8 as default
RUN [ ! -e /usr/bin/python3 ] && ln -s /usr/bin/python3.8 /usr/bin/python3 || true && \
    [ ! -e /usr/bin/pip ] && ln -s /usr/bin/pip3 /usr/bin/pip || true

# Verify CUDA installation
RUN nvcc --version


# Set working directory
WORKDIR /app

# Copy project files
COPY . /app/

# Install required packages
# RUN pip3 install poetry

# Install BIONIC
# RUN poetry install
RUN pip install --no-cache-dir bionic_model-0.2.6+cu111-cp38-cp38-linux_x86_64.whl

# Create directories for mounting
RUN mkdir -p /data/inputs /data/outputs /data/config

# Set environment variables
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

CMD ["/bin/bash"]