# OpenSage TDS

Coding agent configurations for [OpenSage](https://github.com/opensage-agent/OpenSage).

## Prerequisites

- Python >= 3.12
- [uv](https://docs.astral.sh/uv/getting-started/installation/)
- [Docker](https://docs.docker.com/get-docker/)
- [OpenSage](https://github.com/opensage-agent/OpenSage) cloned and installed

## Setup

```bash
# 1. Clone this repo
git clone https://github.com/0-CYBERDYNE-SYSTEMS-0/OpenSage_TDS.git
cd OpenSage_TDS

# 2. Create your .env file with API keys
cp .env.example .env
# Edit .env with your real API keys

# 3. Source env vars (or use direnv / shell profile)
source .env
```

## Available Agents

| Agent | Model | Provider |
|-------|-------|----------|
| `minimax_m27` | MiniMax-M2.7 | MiniMax (OpenAI-compatible) |
| `glm5` | GLM-5 | Z.AI Coding API |
| `glm47` | GLM-4.7 | Z.AI Coding API |
| `glm51` | GLM-5.1 | Z.AI Coding API |
| `glm5_turbo` | GLM-5-Turbo | Z.AI Coding API |
| `gemini_assistant` | Gemini 2.0 Flash | Google (free tier) |

## Running

```bash
# From the OpenSage repo root:
cd /path/to/OpenSage

# Default agent (MiniMax-M2.7):
uv run opensage web --agent /path/to/OpenSage_TDS/agents/minimax_m27 --port 8000

# GLM-5:
uv run opensage web --agent /path/to/OpenSage_TDS/agents/glm5 --port 8000

# Gemini free tier:
uv run opensage web --agent /path/to/OpenSage_TDS/agents/gemini_assistant --port 8000
```

Then open `http://127.0.0.1:8000` in your browser.

## Adding a New Agent

Create a new directory under `agents/` with:

```
agents/my_agent/
  __init__.py   # empty
  agent.py      # defines mk_agent()
  config.toml   # model and sandbox config
```

See existing agents for examples. Key rule: always read API keys from environment variables, never hardcode them.

## Environment Variables

| Variable | Used By | Get From |
|----------|---------|----------|
| `MINIMAX_API_KEY` | minimax_m27 | [platform.minimax.io](https://platform.minimax.io) |
| `ZAI_CODING_API_KEY` | glm5, glm47, glm51, glm5_turbo | [z.ai](https://z.ai) |
| `GEMINI_API_KEY` | gemini_assistant | [aistudio.google.com](https://aistudio.google.com/apikey) |
