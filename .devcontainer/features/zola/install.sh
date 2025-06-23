#!/usr/bin/env bash

export ZOLA_REPOSITORY="getzola/zola"
export ZOLA_VERSION=${ZOLAVERSION:-"latest"}
export ZOLA_DESTINATION="/usr/local/bin"

if [[ "${ZOLA_VERSION}" == "latest" ]]; then
  zolaVersion=$(curl --silent "https://api.github.com/repos/${ZOLA_REPOSITORY}/releases/latest" | jq -r '.tag_name')
  export zolaVersion
else
  zolaVersion="${ZOLA_VERSION}"
  export zolaVersion
fi

zolaArchive="zola-${zolaVersion}-$(uname --machine)-unknown-linux-gnu.tar.gz"
export zolaArchive

zolaDownloadUrl="https://github.com/${ZOLA_REPOSITORY}/releases/download/${zolaVersion}/${zolaArchive}"
export zolaDownloadUrl

curl --location "${zolaDownloadUrl}" --output "${zolaArchive}"

tar --extract --file "${zolaArchive}" --directory "${ZOLA_DESTINATION}"

rm --force "${zolaArchive}"
