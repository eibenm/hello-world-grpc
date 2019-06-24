#!/usr/bin/env bash

set -e

cd /usr/local/app
pub get

echo ""
echo "run \"dart bin/server.dart\" to start the server"
echo ""

# dart bin/server.dart

exec "$@"
