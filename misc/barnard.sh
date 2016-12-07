#!/bin/sh
# Install the CLI-based client barnard for the Mumble voice chat protocol

set -eu
export GOPATH=/home/hiradur/go-apps # adapt username!

go get -u github.com/layeh/barnard/cmd/barnard

# start with
# GOPATH=/home/hiradur/go-apps $GOPATH/bin/barnard -server="192.168.178.70:64738" -username=”Hiradur” -insecure=true

# or login with certificate:
# GOPATH=/home/hiradur/go-apps $GOPATH/bin/barnard -server=”serveraddress:port″ -username=”Hiradur” -insecure=true -certificate=/home/hiradur/.MumbleCertificate.pem
