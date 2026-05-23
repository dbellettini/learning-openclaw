# learning-openclaw

> [!CAUTION]
> **This repository is public.** Never commit secrets, API keys, tokens, `.env` files, or any personal configuration. If it shouldn't be on the internet, it doesn't belong here.

A personal sandbox for learning [OpenClaw](https://openclaw.ai) — an open-source autonomous AI agent (formerly Clawdbot / Moltbot) that runs locally and is accessible via messaging platforms (Telegram, Discord, Slack, WhatsApp, Signal, etc.).

Upstream repo: https://github.com/openclaw/openclaw

## What this repo is

Experiments and notes around self-hosting OpenClaw in Docker Compose. The goal is to understand how OpenClaw works, how to configure it, and how to wire up channels and skills — not to run a production instance.

## Sandbox layout

```
compose.yaml   # Docker Compose stack (openclaw-gateway + openclaw-cli)
Makefile       # Convenience targets
.env           # NOT committed — local secrets only (see .env.example below)
```

## Quick start

1. Copy the upstream `.env.example` to `.env` and fill in at minimum one LLM API key and one channel token.
2. Run `make up` to start the gateway in detached mode.
3. Use `docker compose exec openclaw-cli node dist/index.js` (or `make cli`) to reach the interactive CLI.

The gateway exposes:
- **18789** — main gateway port (REST + WebSocket)
- **18790** — bridge port

## Key environment variables

| Variable | Purpose |
|---|---|
| `OPENCLAW_GATEWAY_TOKEN` | Auth token for the gateway; leave blank to auto-generate |
| `ANTHROPIC_API_KEY` | API key for Claude (Anthropic) |
| `OPENAI_API_KEY` | API key for OpenAI models |
| `TELEGRAM_BOT_TOKEN` | Telegram channel token |
| `DISCORD_BOT_TOKEN` | Discord channel token |
| `OPENCLAW_TZ` | Timezone inside the container (default: UTC) |

See the upstream [`.env.example`](https://github.com/openclaw/openclaw/blob/main/.env.example) for the full list.

## Security notes

- The gateway binds to LAN by default when run in Docker — set `OPENCLAW_GATEWAY_TOKEN` explicitly.
- `cap_drop: [NET_RAW, NET_ADMIN]` and `no-new-privileges:true` are applied in the Compose file.
- OpenClaw is susceptible to prompt injection via untrusted content (emails, web pages, documents) — be mindful of what you let it process.
- Never expose port 18789/18790 to the public internet without a reverse proxy and proper authentication.

## Useful references

- [Getting started](https://docs.openclaw.ai/start/getting-started)
- [Docker install guide](https://docs.openclaw.ai/install/docker)
- [FAQ](https://docs.openclaw.ai/help/faq)
- [Channels configuration](https://docs.openclaw.ai/start/wizard)
