#!/bin/bash

DST=../release
PLUGINS_PATH=plugins

PLUGINS=(
    "center center ./."
    "tln_sysinfo libtln_sysinfo ./${PLUGINS_PATH}/."
    "tln_mqtt libtln_mqtt ./${PLUGINS_PATH}/."
    "tln_devinfo libtln_devinfo ./${PLUGINS_PATH}/."
    "tln_log libtln_log ./${PLUGINS_PATH}/."
    "tln_cfg libtln_cfg ./${PLUGINS_PATH}/."
)

# clean
rm center
rm -rf plugins

mkdir -p ${PLUGINS_PATH}

# build
cd ..
for PLUGIN_INFO in "${PLUGINS[@]}"; do
    IFS=' ' read -r -a PLUGIN <<< "$PLUGIN_INFO"
    SRC_PATH=${PLUGIN[0]}
    OUTPUT=${PLUGIN[1]}
    DST_PATH=${PLUGIN[2]}

    echo "Processing ${SRC_PATH}..."
    if [ -d "$SRC_PATH" ]; then
        cd ${SRC_PATH}
        cargo fmt
        cargo clippy
        cargo build --release
        cp target/release/${OUTPUT} ${DST}/${DST_PATH}
        cp target/release/${OUTPUT}.so ${DST}/${DST_PATH}
        cp target/release/${OUTPUT}.dylib ${DST}/${DST_PATH}
        cd ..
    fi
done

cd release
echo "------------------------------"
./center
