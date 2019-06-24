#!/usr/bin/env bash

set -o errexit # causes script to exit immediately when a command fails
set -o pipefail # causes pipe to fail if any command in the pipeline fails

protoc -I protos/ protos/helloworld.proto --dart_out=grpc:client/lib/src/generated
protoc -I protos/ protos/helloworld.proto --dart_out=grpc:server/lib/src/generated
