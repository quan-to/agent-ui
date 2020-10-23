#!/usr/bin/env bash

BUILD_LINUX_ARCH="arm arm64 386 amd64"
BUILD_OTHER_ARCH="386 amd64"
BUILD_OS="windows freebsd darwin openbsd"

export GOCACHE=/tmp/gocache
export PATH=$PATH:$(go env GOPATH)/bin

TAG=$(git describe --exact-match --tags HEAD)
TAG=${TAG:-develop}
set -e

# ----------------------------------- #
echo "Releasing for tag ${TAG}"
echo "I'm in $(pwd)"
mkdir -p zips

# ----------------------------------- #
echo "Installing GOX"
go get github.com/mitchellh/gox
go install github.com/mitchellh/gox
GO111MODULE=off go get github.com/mitchellh/gox
GO111MODULE=off go install github.com/mitchellh/gox

# ----------------------------------- #
echo "Getting Dependencies"
GOOS=linux go get ./...
GOOS=darwin go get ./...
GOOS=windows go get ./...

# ----------------------------------- #
echo "Installing Astilectron"

GO111MODULE=off go get github.com/asticode/go-astilectron-bundler/...
GO111MODULE=off go install github.com/asticode/go-astilectron-bundler/astilectron-bundler

echo "Bundling it"
./scripts/bundleit.sh

cd output/darwin-amd64;  zip -9 -r "../../zips/AgentUI-${TAG}-macosx64.zip" AgentUI.app; cd ../..
cd output/windows-amd64; zip -9 -r "../../zips/AgentUI-${TAG}-windows64.zip" AgentUI.exe; cd ../..
cd output/linux-amd64;   zip -9 -r "../../zips/AgentUI-${TAG}-linux64.zip" AgentUI; cd ../..

# ----------------------------------- #
echo "Zip Files: "
ls -la zips
