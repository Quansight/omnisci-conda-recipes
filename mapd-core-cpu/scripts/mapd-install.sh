#!/usr/bin/env bash

set -ex

mkdir -p "${MAPD_STORAGE}"
mkdir -p "${MAPD_DATA}"

if [ ! -d "${MAPD_DATA}/mapd_catalogs" ]; then
  ${MAPD_PATH}/bin/mapd_initdb "${MAPD_DATA}"
fi

chown -R $MAPD_USER:$MAPD_GROUP "${MAPD_DATA}"
chown -R $MAPD_USER:$MAPD_GROUP "${MAPD_STORAGE}"

sed -e "s#@MAPD_PATH@#${MAPD_PATH}#g" \
    -e "s#@MAPD_STORAGE@#${MAPD_STORAGE}#g" \
    -e "s#@MAPD_DATA@#${MAPD_DATA}#g" \
    -e "s#@MAPD_USER@#${MAPD_USER}#g" \
    -e "s#@MAPD_GROUP@#${MAPD_GROUP}#g" \
    ${CONDA_PREFIX}/systemd/mapd.conf.in > "${MAPD_STORAGE}/mapd.conf"

chown ${MAPD_USER}:${MAPD_GROUP} "${MAPD_STORAGE}/mapd.conf"

# start mapd server
# ${MAPD_PATH}/bin/mapd_server --config "${MAPD_STORAGE}/mapd.conf"
