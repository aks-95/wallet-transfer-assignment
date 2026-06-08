.PHONY: up down test lint fmt run tidy

DATABASE_URL ?= postgres://wallet:wallet@localhost:5432/wallet_transfer?sslmode=disable

up:
	docker compose up -d

down:
	docker compose down

tidy:
	go mod tidy

test:
	go test ./... -race -count=1

lint:
	golangci-lint run ./...

fmt:
	gofmt -w .

fmt-check:
	@test -z "$$(gofmt -l .)"

run:
	DATABASE_URL=$(DATABASE_URL) go run ./cmd/server
