#!/bin/bash

set -e

echo "=== Updating package list and installing prerequisites ==="
sudo apt update
sudo apt install -y software-properties-common build-essential \
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
    wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev \
    libxmlsec1-dev libffi-dev liblzma-dev

echo "=== Downloading Python 3.10.12 source code ==="
cd /tmp
wget https://www.python.org/ftp/python/3.10.12/Python-3.10.12.tgz
tar -xf Python-3.10.12.tgz
cd Python-3.10.12

echo "=== Configuring and building Python 3.10.12 ==="
./configure --enable-optimizations
make -j$(nproc)

echo "=== Installing Python 3.10.12 ==="
sudo make altinstall

echo "=== Verifying Python installation ==="
/usr/local/bin/python3.10 --version

echo "=== Python 3.10.12 ins
