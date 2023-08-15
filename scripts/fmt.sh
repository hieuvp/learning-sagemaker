#!/usr/bin/env bash

set -eoux pipefail

(
  cd scripts
  chmod +x ./*.sh
  shfmt -i 2 -ci -sr -bn -s -w ./*.sh
)

(
  prettier --write README.md
  grep -v "^#" ".env" | sed -E "s/(.+)=(.+)/\1=<YOUR_\1>/" > ".env.example"
)

(
  cd notebooks
  black ./*.ipynb
)
