#!/usr/bin/env sh

CONFIG_DIR=/app/config
CONFIG_FILE=${CONFIG_DIR}/vialegacy.yml

{
if [ -f ${CONFIG_FILE} ]; then
  echo "${CONFIG_FILE} exists, skipping parse..."
  exit 0
fi
}

set -e

echo "Parsing environment for ${CONFIG_FILE}"
mkdir -p ${CONFIG_DIR}
touch ${CONFIG_FILE}

# parse env vars
IFS='
'
parsedDynamicOnground="${VL_DYNAMIC_ONGROUND:-true}"
parsedIgnoreLong1_8ChannelNames="${VL_IGNORE_LONG_1_8_CHANNEL_NAMES:-true}"
parsedLegacySkullLoading="${VL_LEGACY_SKULL_LOADING:-false}"
parsedLegacySkinLoading="${VL_LEGACY_SKIN_LOADING:-false}"
parsedSoundEmulation="${VL_SOUND_EMULATION:-true}"
parsedOldBiomes="${VL_OLD_BIOMES:-true}"
parsedRemapBasedOnColor="${VL_REMAP_BASED_ON_COLOR:-true}"
parsedClassicChunkRange="${VL_CLASSIC_CHUNK_RANGE:-10}"
parsedEnableClassicFly="${VL_ENABLE_CLASSIC_FLY:-false}"

# write to config file
echo "dynamic-onground: ${parsedDynamicOnground}" >> ${CONFIG_FILE}
echo "ignore-long-1_8-channel-names: ${parsedIgnoreLong1_8ChannelNames}" >> ${CONFIG_FILE}
echo "legacy-skull-loading: ${parsedLegacySkullLoading}" >> ${CONFIG_FILE}
echo "legacy-skin-loading: ${parsedLegacySkinLoading}" >> ${CONFIG_FILE}
echo "sound-emulation: ${parsedSoundEmulation}" >> ${CONFIG_FILE}
echo "old-biomes: ${parsedOldBiomes}" >> ${CONFIG_FILE}
echo "remap-based-on-color: ${parsedRemapBasedOnColor}" >> ${CONFIG_FILE}
echo "classic-chunk-range: ${parsedClassicChunkRange}" >> ${CONFIG_FILE}
echo "enable-classic-fly: ${parsedEnableClassicFly}" >> ${CONFIG_FILE}
