#!/usr/bin/env ash

CONFIG_DIR=/app/config
CONFIG_FILE=${CONFIG_DIR}/viaaas.yml

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
parsedBindAddresses="${VIAAAS_BIND_ADDRESSES:-0.0.0.0}"
parsedBackendProxy="${VIAAAS_BACKEND_PROXY}"
parsedCompressionLevel="${VIAAAS_COMPRESSION_LEVEL:-6}"
parsedRequireHostName="${VIAAAS_REQUIRE_HOST_NAME:-true}"
parsedHostName="${VIAAAS_HOST_NAME:-viaaas.localhost${IFS}via.localhost${IFS}via.localho.st}"
parsedBackendPort="${VIAAAS_BACKEND_PORT:-25565}"
parsedDefaultParameters="${VIAAAS_DEFAULT_PARAMETERS:-{}}"
parsedBlockLocalAddress="${VIAAAS_BLOCK_LOCAL_ADDRESS:-true}"
parsedBlockedBackAddresses="${VIAAAS_BLOCKED_BACK_ADDRESSES:-*.hypixel.net${IFS}*.minemen.club}"
parsedAllowedBackAddresses="${VIAAAS_ALLOWED_BACK_ADDRESSES:-*}"
parsedShowVersionPing="${VIAAAS_SHOW_VERSION_PING:-true}"
parsedShowBrandInfo="${VIAAAS_SHOW_BRAND_INFO:-true}"
parsedRateLimitWs="${VIAAAS_RATE_LIMIT_WS:-1.5}"
parsedRateLimitConnectionMc="${VIAAAS_RATE_LIMIT_CONNECTION_MC:-10.0}"
parsedRateLimitLoginMc="${VIAAAS_RATE_LIMIT_LOGIN_MC:-0.2}"
parsedListeningWsLimit="${VIAAAS_LISTENING_WS_LIMIT:-10}"
parsedFaviconUrl="${VIAAAS_FAVICON_URL:-https://raw.githubusercontent.com/ViaVersion/VIAaaS/396dcb40249ed0ef292e223c32e7f130699e7153/src/main/resources/web/logo.png}"
parsedForceOnlineMode="${VIAAAS_FORCE_ONLINE_MODE:-false}"
parsedMaxPlayers="${VIAAAS_MAX_PLAYERS:-20}"
parsedProtocolDetectorCache="${VIAAAS_PROTOCOL_DETECTOR_CACHE:-20}"
parsedJwtSecret="${VIAAAS_JWT_SECRET:-$(head -c 64 /dev/urandom | base64 -w 0)}"
parsedBackendAddress="${VIAAAS_BACKEND_ADDRESS}"

# write to config file
echo 'bind-addresses:' >> ${CONFIG_FILE}
for addr in ${parsedBindAddresses}; do
  echo "- $(echo ${addr} | xargs echo -n)" >> ${CONFIG_FILE}
done

echo "backend-proxy: '${parsedBackendProxy}'" >> ${CONFIG_FILE}
echo "compression-level: ${parsedCompressionLevel}" >> ${CONFIG_FILE}
echo "require-host-name: ${parsedRequireHostName}" >> ${CONFIG_FILE}

echo 'host-name:' >> ${CONFIG_FILE}
for name in ${parsedHostName}; do
  echo "- $(echo ${name} | xargs echo -n)" >> ${CONFIG_FILE}
done

echo "default-backend-port: ${parsedBackendPort}" >> ${CONFIG_FILE}
echo "default-parameters: ${parsedDefaultParameters}" >> ${CONFIG_FILE}
echo "block-local-address: ${parsedBlockLocalAddress}" >> ${CONFIG_FILE}


echo 'blocked-back-addresses:' >> ${CONFIG_FILE}
for baddr in ${parsedBlockedBackAddresses}; do
  echo "- '$(echo ${baddr} | xargs echo -n)'" >> ${CONFIG_FILE}
done

echo 'allowed-back-addresses:' >> ${CONFIG_FILE}
for aaddr in ${parsedAllowedBackAddresses}; do
  echo "- '$(echo ${aaddr} | xargs echo -n)'" >> ${CONFIG_FILE}
done

echo "show-version-ping: ${parsedShowVersionPing}" >> ${CONFIG_FILE}
echo "show-brand-info: ${parsedShowBrandInfo}" >> ${CONFIG_FILE}
echo "rate-limit-ws: ${parsedRateLimitWs}" >> ${CONFIG_FILE}
echo "rate-limit-connection-mc: ${parsedRateLimitConnectionMc}" >> ${CONFIG_FILE}
echo "rate-limit-login-mc: ${parsedRateLimitLoginMc}" >> ${CONFIG_FILE}
echo "listening-ws-limit: ${parsedListeningWsLimit}" >> ${CONFIG_FILE}
echo "favicon-url: ${parsedFaviconUrl}" >> ${CONFIG_FILE}
echo "force-online-mode: ${parsedForceOnlineMode}" >> ${CONFIG_FILE}
echo "max-players: ${parsedMaxPlayers}" >> ${CONFIG_FILE}
echo "protocol-detector-cache: ${parsedProtocolDetectorCache}" >> ${CONFIG_FILE}
echo "jwt-secret: ${parsedJwtSecret}" >> ${CONFIG_FILE}
echo "backend-address: '${parsedBackendAddress}'" >> ${CONFIG_FILE}
