#!/bin/bash

set -e

./1_install_dep.sh
./2_env.sh
./3_dirs.sh
./4_clone_go.sh
./5_third_party.sh
./6_vim.sh
./7_git.sh

echo "Log out and log back into your system to complete setup"
