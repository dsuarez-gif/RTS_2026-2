#!/bin/bash

set -e

echo "=========================================="
echo " Real-Time Systems Environment Setup"
echo "=========================================="

echo ""
echo "==> Updating package lists..."
sudo apt-get update

echo ""
echo "==> Installing system dependencies..."

sudo apt-get install -y \
    cmake \
    build-essential \
    openjdk-17-jdk \
    curl \
    git \
    wget \
    unzip \
    pkg-config

echo ""
echo "==> Checking CMake version..."

cmake --version

echo ""
echo "==> Checking Java version..."

java --version

echo ""
echo "==> Installing Lingua Franca..."

curl -Ls https://install.lf-lang.org | \
    bash -s cli --prefix="$HOME/.local"

echo ""
echo "==> Configuring PATH..."

if ! grep -q '\.local/bin' "$HOME/.bashrc"; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi

export PATH="$HOME/.local/bin:$PATH"

echo ""
echo "==> Checking Lingua Franca..."

lfc --version

echo ""
echo "==> Upgrading pip..."

python -m pip install --upgrade pip

echo ""
echo "==> Installing Python packages..."

if [ -f ".devcontainer/requirements.txt" ]; then
    python -m pip install -r .devcontainer/requirements.txt
fi

echo ""
echo "==> Installing Jupyter kernel..."

python -m ipykernel install \
    --user \
    --name quantum-env \
    --display-name "Python (Quantum Environment)"

echo ""
echo "==> Configuring shell..."

if ! grep -q "alias ll=" "$HOME/.bashrc"; then
    echo "alias ll='ls -alF'" >> "$HOME/.bashrc"
fi

echo ""
echo "=========================================="
echo " Setup completed successfully!"
echo "=========================================="

echo ""
echo "Installed software:"
echo "  CMake:"
cmake --version | head -n 1

echo "  GCC:"
gcc --version | head -n 1

echo "  Java:"
java --version 2>&1 | head -n 1

echo "  Lingua Franca:"
lfc --version