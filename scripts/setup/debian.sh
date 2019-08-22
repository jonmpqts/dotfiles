#!/bin/bash -

set -u
set -e
set -o pipefail

DEBIAN_FRONTEND=noninteractive

install_or_upgrade() {
  sudo apt -y install "$@"
}

install_or_upgrade git
install_or_upgrade vim
