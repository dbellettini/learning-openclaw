# learning-openclaw

> [!CAUTION]
> **This repository is public.** Never commit secrets, API keys, tokens, `.env` files, or any personal configuration here.

A personal sandbox for learning [OpenClaw](https://openclaw.ai) — a free, open-source autonomous AI agent (formerly Clawdbot / Moltbot) that runs locally and is reachable via the messaging platforms you already use (Telegram, Discord, Slack, WhatsApp, Signal, and many more).

## What is OpenClaw?

OpenClaw connects to a large language model of your choice (Claude, GPT-4o, Gemini, DeepSeek, …) and acts as a personal assistant you interact with through chat. It can browse the web, manage files, summarise documents, handle emails, schedule calendar entries, and more — all running on your own hardware.

Upstream project: https://github.com/openclaw/openclaw

## This repo

Experiments with running OpenClaw in a Docker Compose sandbox. Nothing here is meant for production.

```
compose.yaml    # Docker Compose stack (openclaw-gateway + openclaw-cli)
.env.example    # Template — copy to .env and fill in your secrets
Makefile        # Convenience targets
.gitignore      # Keeps .env and runtime state out of git
```

## Quick start

```bash
# 1. Copy the env template and fill in at least one LLM key and one channel token
cp .env.example .env

# 2. Pull the image and start the gateway
make pull
make up

# 3. Open the web UI
open http://localhost:18789

# 4. Or drop into an interactive CLI session
make cli
```

### Makefile targets

| Target | What it does |
|---|---|
| `make up` | Start the gateway in detached mode |
| `make down` | Stop and remove containers |
| `make logs` | Follow gateway logs |
| `make pull` | Pull the latest image |
| `make cli` | Open an interactive CLI session |

Runtime state (config, workspace, auth secrets) is stored in `.openclaw/` and `.openclaw-auth/` — both git-ignored.

## References

- [OpenClaw docs](https://docs.openclaw.ai)
- [Getting started](https://docs.openclaw.ai/start/getting-started)
- [Docker install guide](https://docs.openclaw.ai/install/docker)
- [FAQ](https://docs.openclaw.ai/help/faq)
