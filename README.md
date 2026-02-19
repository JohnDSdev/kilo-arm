# Kilo CLI for ARM64

Pre-built ARM64 binaries for [Kilo CLI](https://github.com/Kilo-Org/kilo) - the open source AI coding agent.

## Why This Repo?

The official Kilo CLI releases don't always have ARM64 binaries readily available. This repo provides pre-compiled ARM64 binaries for:

- **linux-arm64** - Standard glibc-based systems (Ubuntu, Debian, Fedora, etc.)
- **linux-arm64-musl** - Alpine Linux and other musl-based systems

## Installation

### Quick Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/JohnDSdev/kilo-arm/main/install | bash
```

### Manual Install

1. Download the appropriate binary for your system:

```bash
# For glibc-based systems (Ubuntu, Debian, etc.)
curl -LO https://github.com/JohnDSdev/kilo-arm/releases/latest/download/kilo-linux-arm64.tar.gz

# For Alpine Linux (musl)
curl -LO https://github.com/JohnDSdev/kilo-arm/releases/latest/download/kilo-linux-arm64-musl.tar.gz
```

2. Extract and install:

```bash
tar -xzf kilo-linux-arm64.tar.gz
mkdir -p ~/.kilo/bin
mv kilo ~/.kilo/bin/
chmod +x ~/.kilo/bin/kilo
```

3. Add to PATH (add to your shell config):

```bash
export PATH="$HOME/.kilo/bin:$PATH"
```

## Usage

```bash
# Start Kilo in your project directory
cd your-project
kilo

# Run with a specific task
kilo run "fix the lint errors"

# Use autonomous mode for CI/CD
kilo run --auto "run tests and fix any failures"
```

## Available Builds

| Platform | Architecture | Variant | Download |
|----------|-------------|---------|----------|
| Linux | ARM64 | glibc | [kilo-linux-arm64.tar.gz](releases/latest/download/kilo-linux-arm64.tar.gz) |
| Linux | ARM64 | musl (Alpine) | [kilo-linux-arm64-musl.tar.gz](releases/latest/download/kilo-linux-arm64-musl.tar.gz) |

## System Requirements

- Linux ARM64 (aarch64) processor
- glibc 2.17+ (for standard build) or musl libc (for musl build)

## Features

Kilo CLI is an open source AI coding agent that:

- Generates code from natural language
- Runs terminal commands
- Automates repetitive tasks
- Supports 500+ AI models
- Includes free models (MiniMax M2.1) - no API key required

## Documentation

For full documentation, visit [kilo.ai/docs](https://kilo.ai/docs)

## Source

This is a redistribution of binaries built from the official [Kilo-Org/kilo](https://github.com/Kilo-Org/kilo) repository.

## License

MIT License - Same as the upstream Kilo project.
