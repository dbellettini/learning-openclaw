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
compose.yaml   # Docker Compose stack (openclaw-gateway + openclaw-cli)
Makefile       # Convenience targets
.env           # NOT committed — local secrets only
```

## Quick start

```bash
# 1. Copy the upstream env template and fill in your keys
curl -o .env https://raw.githubusercontent.com/openclaw/openclaw/main/.env.example

# 2. Start the gateway
make up

# 3. Open an interactive CLI session
docker compose run --rm openclaw-cli
```

The gateway will be available at `http://localhost:18789`.

## References

- [OpenClaw docs](https://docs.openclaw.ai)
- [Getting started](https://docs.openclaw.ai/start/getting-started)
- [Docker install guide](https://docs.openclaw.ai/install/docker)
- [FAQ](https://docs.openclaw.ai/help/faq)
