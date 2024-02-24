#!/usr/bin/env ash

CONFIG_DIR=/app/config/web/js
CONFIG_FILE=${CONFIG_DIR}/config.js

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

# defaults lifted from https://github.com/ViaVersion/VIAaaS/blob/master/src/main/resources/web/js/config.js
IFS='
'
parsedClientId="${WEB_AZURE_CLIENT_ID:-a370fff9-7648-4dbf-b96e-2b4f8d539ac2}"
parsedOrigins="${WEB_WHITELISTED_ORIGINS:-https://via.re.yt.nom.br}"
parsedProxy="${WEB_CORS_PROXY:-https://cors.re.yt.nom.br/}"
[[ -z "${WEB_INSTANCE_SUFFIX}" ]] && parsedSuffix='null' || parsedSuffix="\"${WEB_INSTANCE_SUFFIX}\""

# write to config file
echo "const azureClientId = \"${parsedClientId}\";" >> ${CONFIG_FILE}

echo -n "const whitelistedOrigin = [" >> ${CONFIG_FILE}
count=0
for origin in ${parsedOrigins}
do
  if [ ${count} -ne 0 ]; then
    echo -n "," >> ${CONFIG_FILE}
  fi
  echo -n "\"$(echo ${origin} | xargs echo -n)\"" >> ${CONFIG_FILE}
  count=$((count+1))
done
echo "];" >> ${CONFIG_FILE}

echo "var defaultCorsProxy = \"${parsedProxy}\";" >> ${CONFIG_FILE}
echo "var defaultInstanceSuffix = ${parsedSuffix};" >> ${CONFIG_FILE}
