#!/usr/bin/env ash

CONFIG_DIR=/app/config
CONFIG_FILE=${CONFIG_DIR}/viabackwards.yml

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
parsedAlwaysShowOriginalMobName="${VB_ALWAYS_SHOW_ORIGINAL_MOB_NAME:-true}"
parsedAddCustomEnchantsIntoLore="${VB_ADD_CUSTOM_ENCHANTS_INTO_LORE:-true}"
parsedAddTeamcolorToPrefix="${VB_ADD_TEAMCOLOR_TO_PREFIX:-true}"
parsedFix1_13FacePlayer="${VB_FIX_1_13_FACE_PLAYER:-false}"
parsedFixFormattedInventoryTitles="${VB_FIX_FORMATTED_INVENTORY_TITLES:-true}"
parsedHandlePingsAsInvAcknowledgements="${VB_HANDLE_PINGS_AS_INV_ACKNOWLEDGEMENTS:-false}"

# write to config file
echo "always-show-original-mob-name: ${parsedAlwaysShowOriginalMobName}" >> ${CONFIG_FILE}
echo "add-custom-enchants-into-lore: ${parsedAddCustomEnchantsIntoLore}" >> ${CONFIG_FILE}
echo "add-teamcolor-to-prefix: ${parsedAddTeamcolorToPrefix}" >> ${CONFIG_FILE}
echo "fix-1_13-face-player: ${parsedFix1_13FacePlayer}" >> ${CONFIG_FILE}
echo "fix-formatted-inventory-titles: ${parsedFixFormattedInventoryTitles}" >> ${CONFIG_FILE}
echo "handle-pings-as-inv-acknowledgements: ${parsedHandlePingsAsInvAcknowledgements}" >> ${CONFIG_FILE}
