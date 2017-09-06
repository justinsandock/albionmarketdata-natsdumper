#!/usr/bin/env bash

set -eo pipefail

go get -u github.com/golang/dep/cmd/dep
dep ensure

GOOS=windows \
GOARCH=amd64 \
go build -ldflags "-s -w -X main.version=$CIRCLE_TAG" cmd/albiondata-natsdumper/albiondata-natsdumper.go

gzip -9 albiondata-natsdumper.exe
mv albiondata-natsdumper.exe.gz albiondata-natsdumper-windows-amd64.exe.gz