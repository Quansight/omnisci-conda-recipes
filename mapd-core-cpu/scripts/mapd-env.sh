#!/usr/bin/env bash

set -ex

export MAPD_PATH="${CONDA_PREFIX}"
export MAPD_STORAGE="${MAPD_PATH}/var/lib/mapd"
export MAPD_USER="$(whoami)"
export MAPD_GROUP="$(groups $(whoami) | cut -d' ' -f1)"
export MAPD_DATA="${MAPD_STORAGE}/data"
export MAPD_LOG="${MAPD_DATA}/mapd_log"

