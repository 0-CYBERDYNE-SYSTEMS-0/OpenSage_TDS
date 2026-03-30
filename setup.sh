#!/usr/bin/env bash
# Setup script for OpenSage TDS - run once per machine
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== OpenSage TDS Setup ==="

# Check prerequisites
echo ""
echo "Checking prerequisites..."

command -v git >/dev/null 2>&1 || { echo "ERROR: git not found. Install it first."; exit 1; }
echo "  git: OK"

command -v uv >/dev/null 2>&1 || { echo "ERROR: uv not found. Install: https://docs.astral.sh/uv/getting-started/installation/"; exit 1; }
echo "  uv: OK"

command -v docker >/dev/null 2>&1 || { echo "WARNING: docker not found. Sandbox features won't work."; }
echo "  docker: $(command -v docker >/dev/null 2>&1 && echo 'OK' || echo 'NOT FOUND')"

# Check OpenSage installation
echo ""
echo "Checking OpenSage..."

if [ -d "${HOME}/OpenSage" ]; then
    OPENSAGE_DIR="${HOME}/OpenSage"
elif [ -d "${HOME}/repos/OpenSage" ]; then
    OPENSAGE_DIR="${HOME}/repos/OpenSage"
else
    echo "OpenSage not found in ~/OpenSage or ~/repos/OpenSage"
    echo "Clone it first:"
    echo "  git clone https://github.com/opensage-agent/OpenSage ~/OpenSage"
    echo "  cd ~/OpenSage && uv python install && uv sync"
    exit 1
fi

echo "  Found at: ${OPENSAGE_DIR}"

# Install OpenSage deps if needed
if [ ! -d "${OPENSAGE_DIR}/.venv" ]; then
    echo "  Installing OpenSage dependencies..."
    cd "${OPENSAGE_DIR}" && uv python install && uv sync
fi

# Setup .env
if [ ! -f "${SCRIPT_DIR}/.env" ]; then
    echo ""
    echo "Creating .env from .env.example..."
    cp "${SCRIPT_DIR}/.env.example" "${SCRIPT_DIR}/.env"
    echo "EDIT ${SCRIPT_DIR}/.env with your API keys before running agents."
else
    echo ""
    echo ".env already exists."
fi

# Done
echo ""
echo "=== Setup Complete ==="
echo ""
echo "To run an agent:"
echo "  source ${SCRIPT_DIR}/.env"
echo "  cd ${OPENSAGE_DIR}"
echo "  uv run opensage web --agent ${SCRIPT_DIR}/agents/minimax_m27 --port 8000"
