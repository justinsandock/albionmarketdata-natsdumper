#!/usr/bin/env bash

set -eo pipefail

go get -u github.com/golang/dep/cmd/dep
dep ensure

go build -ldflags "-s -w -X main.version=$CIRCLE_TAG" cmd/albiondata-natsdumper/albiondata-natsdumper.go

gzip -9 albiondata-natsdumper
mv albiondata-natsdumper.gz albiondata-natsdumper-linux-amd64.gz