#!/bin/bash
set -e

HUGO_VER="${HUGO_VERSION:-0.91.2}"

if ! command -v hugo &> /dev/null; then
    echo "Hugo not found. Downloading Hugo Extended ${HUGO_VER} from GitHub releases..."
    TMPDIR=$(mktemp -d)
    curl -fsSL -o "${TMPDIR}/hugo.tar.gz" \
        "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VER}/hugo_extended_${HUGO_VER}_Linux-64bit.tar.gz"
    tar -xzf "${TMPDIR}/hugo.tar.gz" -C "${TMPDIR}"
    export PATH="${TMPDIR}:${PATH}"
    echo "Hugo Extended ${HUGO_VER} installed successfully."
fi

exec hugo "$@"
