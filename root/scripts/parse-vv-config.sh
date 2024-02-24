#!/usr/bin/bash

CONFIG_DIR=/app/config
CONFIG_FILE=${CONFIG_DIR}/viaversion.yml

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

parsedCheckforupdates="${VV_CHECKFORUPDATES:-true}"
parsedSendSupportedVersions="${VV_SEND_SUPPORTED_VERSIONS:-false}"
parsedBlockVersions="${VV_BLOCK_VERSIONS}"
parsedSuppressConversionWarnings="${VV_SUPPRESS_CONVERSION_WARNINGS:-false}"
parsedRegisterUserconnectionsOnJoin="${VV_REGISTER_USERCONNECTIONS_ON_JOIN:-true}"
parsedHologramPatch="${VV_HOLOGRAM_PATCH:-false}"
parsedHologramY="${VV_HOLOGRAM_Y:--0.96}"
parsedPistonAnimationPatch="${VV_PISTON_ANIMATION_PATCH:-false}"
parsedChatNbtFix="${VV_CHAT_NBT_FIX:-true}"
parsedTeamColourFix="${VV_TEAM_COLOUR_FIX:-true}"
parsedDisable11_3AutoComplete="${VV_DISABLE_1_13_AUTO_COMPLETE:-false}"
parsed11_3TabCompleteDelay="${VV_1_13_TAB_COMPLETE_DELAY:-0}"
parsedFixLowSnowCollision="${VV_FIX_LOW_SNOW_COLLISION:-false}"
parsedFixInfestedBlockBreaking="${VV_FIX_INFESTED_BLOCK_BREAKING:-true}"
parsedTruncate1_14Books="${VV_TRUNCATE_1_14_BOOKS:-false}"
parsedFixNonFullBlocklight="${VV_FIX_NON_FULL_BLOCKLIGHT:-true}"
parsedFix1_14HealthNan="${VV_FIX_1_14_HEALTH_NAN:-true}"
parsedUse1_15InstantRespawn="${VV_USE_1_15_INSTANT_RESPAWN:-false}"
parsedServersideBlockconnections="${VV_SERVERSIDE_BLOCKCONNECTIONS:-true}"
parsedReduceBlockstorageMemory="${VV_REDUCE_BLOCKSTORAGE_MEMORY:-false}"
parsedFlowerstemWhenBlockAbove="${VV_FLOWERSTEM_WHEN_BLOCK_ABOVE:-false}"
parsedVineClimbFix="${VV_VINE_CLIMB_FIX:-false}"
parsedIgnoreLong1_16ChannelNames="${VV_IGNORE_LONG_1_16_CHANNEL_NAMES:-true}"
parsedForcedUse117ResourcePack="${VV_FORCED_USE_1_17_RESOURCE_PACK:-false}"
parsedResourcePack1_17Prompt="${VV_RESOURCE_PACK_1_17_PROMPT}"
parsedCache117Light="${VV_CACHE_1_17_LIGHT:-true}"
parsedArmorToggleFix="${VV_ARMOR_TOGGLE_FIX:-true}"

parsedMap1_16WorldNamesOverworld="${VV_MAP_1_16_WORLD_NAMES_OVERWORLD:-minecraft:overworld}"
parsedMap1_16WorldNamesNether="${VV_MAP_1_16_WORLD_NAMES_NETHER:-minecraft:the_nether}"
parsedMap1_16WorldNamesEnd="${VV_MAP_1_16_WORLD_NAMES_END:-minecraft:the_end}"

parsedPreventCollision="${VV_PREVENT_COLLISION:-true}"
parsedAutoTeam="${VV_AUTO_TEAM:-true}"
parsedSuppressMetadataErrors="${VV_SUPPRESS_METADATA_ERRORS:-false}"
parsedShieldBlocking="${VV_SHIELD_BLOCKING:-true}"
parsedNoDelayShieldBlocking="${VV_NO_DELAY_SHIELD_BLOCKING:-false}"
parsedShowShieldWhenSwordInHand="${VV_SHOW_SHIELD_WHEN_SWORD_IN_HAND:-false}"
parsedSimulatePt="${VV_SIMULATE_PT:-true}"
parsedBossbarPatch="${VV_BOSSBAR_PATCH:-true}"
parsedBossbarAntiFlicker="${VV_BOSSBAR_ANTI_FLICKER:-false}"
parsedUseNewEffectIndicator="${VV_USE_NEW_EFFECT_INDICATOR:-true}"
parsedReplacePistons="${VV_REPLACE_PISTONS:-false}"
parsedReplacementPistonId="${VV_REPLACEMENT_PISTON_ID:-0}"
parsedChunkBorderFix="${VV_CHUNK_BORDER_FIX:-false}"
parsedForceJsonTransform="${VV_FORCE_JSON_TRANSFORM:-false}"
parsedMinimizeCooldown="${VV_MINIMIZE_COOLDOWN:-true}"
parsedLeftHandedHandling="${VV_LEFT_HANDED_HANDLING:-true}"

# write to config file



echo "checkforupdates: ${parsedCheckforupdates}" >> ${CONFIG_FILE}
echo "send-supported-versions: ${parsedSendSupportedVersions}" >> ${CONFIG_FILE}

echo -n "block-versions: [" >> ${CONFIG_FILE}
count=0
for version in ${parsedBlockVersions}
do
  if [ ${count} -ne 0 ]; then
    echo -n "," >> ${CONFIG_FILE}
  fi
  echo -n "\"$(echo ${version} | xargs echo -n)\"" >> ${CONFIG_FILE}
  count=$((count+1))
done
echo "]" >> ${CONFIG_FILE}

echo "suppress-conversion-warnings: ${parsedSuppressConversionWarnings}" >> ${CONFIG_FILE}
echo "register-userconnections-on-join: ${parsedRegisterUserconnectionsOnJoin}" >> ${CONFIG_FILE}
echo "hologram-patch: ${parsedHologramPatch}" >> ${CONFIG_FILE}
echo "hologram-y: ${parsedHologramY}" >> ${CONFIG_FILE}
echo "piston-animation-patch: ${parsedPistonAnimationPatch}" >> ${CONFIG_FILE}
echo "chat-nbt-fix: ${parsedChatNbtFix}" >> ${CONFIG_FILE}
echo "team-colour-fix: ${parsedTeamColourFix}" >> ${CONFIG_FILE}
echo "disable-1_13-auto-complete: ${parsedDisable1_13AutoComplete}" >> ${CONFIG_FILE}
echo "1_13-tab-complete-delay: ${parsed1_13TabCompleteDelay}" >> ${CONFIG_FILE}
echo "fix-low-snow-collision: ${parsedFixLowSnowCollision}" >> ${CONFIG_FILE}
echo "fix-infested-block-breaking: ${parsedFixInfestedBlockBreaking}" >> ${CONFIG_FILE}
echo "truncate-1_14-books: ${parsedTruncate1_14Books}" >> ${CONFIG_FILE}
echo "fix-non-full-blocklight: ${parsedFixNonFullBlocklight}" >> ${CONFIG_FILE}
echo "fix-1_14-health-nan: ${parsedFix1_14HealthNan}" >> ${CONFIG_FILE}
echo "use-1_15-instant-respawn: ${parsed-use-1_15-instant-respawn}" >> ${CONFIG_FILE}
echo "serverside-blockconnections: ${parsedServersideBlockconnections}" >> ${CONFIG_FILE}
echo "reduce-blockstorage-memory: ${parsedReduceBlockstorageMemory}" >> ${CONFIG_FILE}
echo "flowerstem-when-block-above: ${parsedFlowerstemWhenBlockAbove}" >> ${CONFIG_FILE}
echo "vine-climb-fix: ${parsedVineClimbFix}" >> ${CONFIG_FILE}
echo "ignore-long-1_16-channel-names: ${parsedIgnoreLong1_16ChannelNames}" >> ${CONFIG_FILE}
echo "forced-use-1_17-resource-pack: ${parsedForcedUse1_17ResourcePack}" >> ${CONFIG_FILE}
echo "resource-pack-1_17-prompt: '${parsedResourcePack1_17Prompt}'" >> ${CONFIG_FILE}
echo "cache-1_17-light: ${parsedCache1_17Light}" >> ${CONFIG_FILE}
echo "armor-toggle-fix: ${parsedArmorToggleFix}" >> ${CONFIG_FILE}

echo "map-1_16-world-names:" >> ${CONFIG_FILE}
echo "  overworld: ${parsedMap1_16WorldNamesOverworld}" >> ${CONFIG_FILE}
echo "  nether: ${parsedMap1_16WorldNamesNether}" >> ${CONFIG_FILE}
echo "  end: minecraft:the_end: ${parsedMap1_16WorldNamesEnd}" >> ${CONFIG_FILE}

echo "prevent-collision: ${parsedPreventCollision}" >> ${CONFIG_FILE}
echo "auto-team: ${parsedAutoTeam}" >> ${CONFIG_FILE}
echo "suppress-metadata-errors: ${parsedSuppressMetadataErrors}" >> ${CONFIG_FILE}
echo "shield-blocking: ${parsedShieldBlocking}" >> ${CONFIG_FILE}
echo "no-delay-shield-blocking: ${parsedNoDelayShieldBlocking}" >> ${CONFIG_FILE}
echo "show-shield-when-sword-in-hand: ${parsedShowShieldWhenSwordInHand}" >> ${CONFIG_FILE}
echo "simulate-pt: ${parsedSimulatePt}" >> ${CONFIG_FILE}
echo "bossbar-patch: ${parsedBossbarPatch}" >> ${CONFIG_FILE}
echo "bossbar-anti-flicker: ${parsedBossbarAntiFlicker}" >> ${CONFIG_FILE}
echo "use-new-effect-indicator: ${parsedUseNewEffectIndicator}" >> ${CONFIG_FILE}
echo "replace-pistons: ${parsedReplacePistons}" >> ${CONFIG_FILE}
echo "replacement-piston-id: ${parsedReplacementPistonId}" >> ${CONFIG_FILE}
echo "chunk-border-fix: ${parsedChunkBorderFix}" >> ${CONFIG_FILE}
echo "force-json-transform: ${parsedForceJsonTransform}" >> ${CONFIG_FILE}
echo "minimize-cooldown: ${parsedMinimizeCooldown}" >> ${CONFIG_FILE}
echo "left-handed-handling: ${parsedLeftHandedHandling}" >> ${CONFIG_FILE}