#!/usr/bin/env sh

CONFIG_DIR=/app/config
CONFIG_FILE=${CONFIG_DIR}/viarewind.yml

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
parsedCooldownIndicator="${VR_COOLDOWN_INDICATOR:-TITLE}"
parsedReplaceAdventure="${VR_REPLACE_ADVENTURE:-false}"
parsedReplaceParticles="${VR_REPLACE_PARTICLES:-false}"
parsedMaxBookPages="${VR_MAX_BOOK_PAGES:-100}"
parsedMaxBookPageLength="${VR_MAX_BOOK_PAGE_LENGTH:-5000}"
parsedEmulateWorldBorder="${VR_EMULATE_WORLD_BORDER:-true}"
parsedWorldBorderParticle="${VR_WORLD_BORDER_PARTICLE:-fireworksSpark}"

# write to config file
echo "cooldown-indicator: ${parsedCooldownIndicator}" >> ${CONFIG_FILE}
echo "replace-adventure: ${parsedReplaceAdventure}" >> ${CONFIG_FILE}
echo "replace-particles: ${parsedReplaceParticles}" >> ${CONFIG_FILE}
echo "max-book-pages: ${parsedMaxBookPages}" >> ${CONFIG_FILE}
echo "max-book-page-length: ${parsedMaxBookPageLength}" >> ${CONFIG_FILE}
echo "emulate-world-border: ${parsedEmulateWorldBorder}" >> ${CONFIG_FILE}
echo "world-border-particle: ${parsedWorldBorderParticle}" >> ${CONFIG_FILE}
