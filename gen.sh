#!/usr/bin/env bash

set -e

API_DIR="api"

copy_cmd() {
  if command -v pbcopy >/dev/null 2>&1; then
    pbcopy
  elif command -v xclip >/dev/null 2>&1; then
    xclip -selection clipboard
  elif command -v xsel >/dev/null 2>&1; then
    xsel --clipboard --input
  else
    echo "No clipboard utility found (pbcopy/xclip/xsel)" >&2
    exit 1
  fi
}

{
  find "$API_DIR" -type f | sort | while read -r file; do
    echo "===== $file ====="
    cat "$file"
    echo
  done
} | copy_cmd
