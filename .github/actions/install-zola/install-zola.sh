#!/usr/bin/env bash

set -euo pipefail

if [[ "${ZOLA_VERSION}" == "latest" ]]; then
  release="$(curl --fail --show-error --silent https://api.github.com/repos/getzola/zola/releases/latest)"
else
  release="$(curl --fail --show-error --silent "https://api.github.com/repos/getzola/zola/releases/tags/${ZOLA_VERSION}")"
fi

version="$(jq -r '.tag_name' <<<"${release}")"
archive="zola-${version}-$(uname --machine)-unknown-linux-gnu.tar.gz"
checksum="$(jq -r --arg archive "${archive}" '.assets[] | select(.name == $archive) | (.digest // "") | sub("^sha256:"; "")' <<<"${release}")"

curl --fail-with-body --location --show-error --silent "https://github.com/getzola/zola/releases/download/${version}/${archive}" \
  --output "/tmp/zola.tar.gz"

if [[ "${checksum}" =~ ^[a-f0-9]{64}$ ]]; then
  printf '%s  %s\n' "${checksum}" "/tmp/zola.tar.gz" | sha256sum --check --status
else
  echo "Warning: no valid SHA-256 checksum is available for ${archive}; skipping verification." >&2
fi

tar --extract --file "/tmp/zola.tar.gz" --directory "/usr/local/bin"

zola --version
