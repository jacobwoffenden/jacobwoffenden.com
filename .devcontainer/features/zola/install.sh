#!/usr/bin/env bash

export ZOLA_REPOSITORY="getzola/zola"
export ZOLA_VERSION=${ZOLAVERSION:-"latest"}
export ZOLA_DESTINATION="/usr/local/bin"

if [[ "${ZOLA_VERSION}" == "latest" ]]; then
  zolaVersion=$(curl --silent "https://api.github.com/repos/${ZOLA_REPOSITORY}/releases/latest" | jq -r '.tag_name')
else
  zolaVersion="${ZOLA_VERSION}"
fi

export ZOLA_ARCHIVE="zola-${zolaVersion}-$(uname --machine)-unknown-linux-gnu.tar.gz"
export ZOLA_DOWNLOAD_URL="https://github.com/${ZOLA_REPOSITORY}/releases/download/${zolaVersion}/${ZOLA_ARCHIVE}"

curl --location "${ZOLA_DOWNLOAD_URL}" --output "${ZOLA_ARCHIVE}"

tar --extract --file "${ZOLA_ARCHIVE}" --directory "${ZOLA_DESTINATION}"

rm --force "${ZOLA_ARCHIVE}"
