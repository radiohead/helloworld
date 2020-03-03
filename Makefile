GOPKGS		:= $(shell go list ./... | grep -v "/test")
GOOS			:= darwin
GOARCH		:= amd64
GONAME		:= ./bin/hello

all: test build
.PHONY: all

test:
	CGO_ENABLED=1 go test -race -cover -covermode=atomic -v $(GOPKGS)
.PHONY: test

build:
	CGO_ENABLED=0 GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(GONAME) ./cmd/hello
.PHONY: build
