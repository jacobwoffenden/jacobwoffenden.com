#!/usr/bin/env bash

# Insall Zola
export ZOLA_VERSION="0.19.2"

curl --location \
  "https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-gnu.tar.gz" \
  --output /tmp/zola.tar.gz

sudo tar --extract --file /tmp/zola.tar.gz --directory /usr/local/bin

rm --force /tmp/zola.tar.gz
