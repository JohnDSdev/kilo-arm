#!/bin/bash
# Build Kilo CLI for ARMv8.0 CPUs (Cortex-A53, Rock 2A, Raspberry Pi 4, etc.)
# Run this script on your ARM64 device

set -e

echo "=== Building Kilo CLI for ARMv8.0 ==="

# Install dependencies
echo "Checking dependencies..."
if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y unzip git python3 make g++ curl
fi

# Install Bun if needed
if ! command -v bun &> /dev/null; then
    echo "Installing Bun..."
    curl -fsSL https://bun.sh/install | bash
    export PATH="$HOME/.bun/bin:$PATH"
else
    export PATH="$HOME/.bun/bin:$PATH"
fi

echo "Bun version: $(bun --version)"

# Create build directory
BUILD_DIR="$HOME/kilo-build"
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Clone Kilo
echo "Cloning Kilo repository..."
git clone --depth 1 https://github.com/Kilo-Org/kilo.git .
git checkout dev

# Install dependencies
echo "Installing dependencies..."
bun install

# Build
echo "Building ARM64 binary..."
cd packages/opencode
bun run build -- --single

# Install
BINARY="$BUILD_DIR/packages/opencode/dist/@kilocode/cli-linux-arm64/bin/kilo"
INSTALL_DIR="$HOME/.kilo/bin"
mkdir -p "$INSTALL_DIR"
cp "$BINARY" "$INSTALL_DIR/"
chmod +x "$INSTALL_DIR/kilo"

echo ""
echo "=== Build Complete ==="
echo "Binary installed to: $INSTALL_DIR/kilo"
echo ""
echo "Add to PATH:"
echo "  export PATH=\"\$HOME/.kilo/bin:\$PATH\""
echo ""
echo "Run 'kilo' to start!"
