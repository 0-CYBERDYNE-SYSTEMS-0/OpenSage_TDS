# open_sage_tds

[![Python](https://img.shields.io/badge/Python-3.12+-3776AB?style=flat&logo=python&logoColor=white)](https://python.org)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Pre-configured coding agent profiles for multi-model workflows. Drop-in agent configs for MiniMax, ZAI GLM, and Gemini — ready to run with [OpenSage](https://github.com/opensage-agent/OpenSage).

## What's inside

Six agent configurations, each wired to a different model:

| Agent | Model | Why use it |
|-------|-------|------------|
| `minimax_m27` | MiniMax-M2.7 | Strong general-purpose coding |
| `glm5` | GLM-5 | Z.AI's flagship reasoning model |
| `glm47` | GLM-4.7 | Fast, capable, cost-effective |
| `glm51` | GLM-5.1 | Latest Z.AI release |
| `glm5_turbo` | GLM-5-Turbo | Speed-optimized variant |
| `gemini_assistant` | Gemini 2.0 Flash | Google's free tier — zero cost |

## Setup

```bash
git clone https://github.com/0-CYBERDYNE-SYSTEMS-0/OpenSage_TDS.git
cd OpenSage_TDS
cp .env.example .env
# Add your API keys to .env
source .env
```

Requires Python >= 3.12, [uv](https://docs.astral.sh/uv/), and [OpenSage](https://github.com/opensage-agent/OpenSage).

## Running

```bash
# From your OpenSage installation:
opensage --agent minimax_m27

# Or point OpenSage at this config directory:
opensage --config /path/to/OpenSage_TDS/agents
```

## Adding new agents

Copy any existing agent YAML, change the model provider and parameters, and add your API key to `.env`. Each agent is a single config file — no scaffolding required.

## License

MIT
