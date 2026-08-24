#!/usr/bin/env bash

if [[ "${ZOLA_VERSION}" == "latest" ]]; then
  version="$(curl --silent https://api.github.com/repos/getzola/zola/releases/latest | jq -r '.tag_name')"
else
  version="${ZOLA_VERSION}"
fi

curl --fail-with-body --location --silent "https://github.com/getzola/zola/releases/download/${version}/zola-${version}-$(uname --machine)-unknown-linux-gnu.tar.gz" \
  --output "/tmp/zola.tar.gz"

tar --extract --file "/tmp/zola.tar.gz" --directory "/usr/local/bin"

zola --version
