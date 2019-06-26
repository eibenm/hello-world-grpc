hello-world-grpc
============

This is a test repo to try out a simple server client communication of gRCP.

Both the server and client are written in Dart with an envoy proxy server.

### Requirements

- Dart 2.3 ( current stable Dart version )
- Docker
- Protocol buffer compiler
    - See [install directions](#protoc-install)
- Install Dart protoc plugin 
    - `pub global activate protoc_plugin`
- Intall Dart webdev plugin
    - `pub global activate webdev`

### Setup

Ensure [requirements](#requirements) are met.

`cd` into the `client` and `server` folders and pub get.

### How to run server

```bash
./scripts/start-server.sh
```

This will build the images and start the containers.  When done, you will be dropped into the command line for the Dart server in `/usr/local/app`.

run "dart bin/server.dart" to start the server

### How to run client

```bash
webdev serve web:9000
```

Navigate browser to `localhost:9000`

### Protoc install

Latest version can be install from: https://github.com/protocolbuffers/protobuf/releases

For example, on MacOS, download the ( current lastest ) `protoc-3.8.0-osx-x86_64.zip` and unzip the dir to your home folder.

Then add the following to your `.bash_profile` or alternative.

```bash
export PATH=$PATH:$HOME/protoc-3.8.0-osx-x86_64/bin
```

For more on protocol buffers and Dart: https://developers.google.com/protocol-buffers/docs/darttutorial
For the Dart gRPC quick start: https://grpc.io/docs/quickstart/dart/

#### How generate new proto code

```bash
./scripts/generate-code.sh
```

This will automatically put the generated proto code in `./client/lib/src/generated` and `./server/lib/src/generated`.
