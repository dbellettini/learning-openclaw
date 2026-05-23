.PHONY: up down logs cli pull

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f openclaw-gateway

pull:
	docker compose pull

cli:
	docker compose run --rm openclaw-cli
