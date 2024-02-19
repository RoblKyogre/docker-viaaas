#!/usr/bin/bash

WEB_CONFIG_DIR=/app/config/web/js
WEB_CONFIG_FILE=${WEB_CONFIG_DIR}/config.js

{
if [ -f ${WEB_CONFIG_FILE} ]; then
  echo "${WEB_CONFIG_FILE} exists, skipping parse..."
  exit 0
fi
}

set -e

echo "Parsing environment for ${WEB_CONFIG_FILE}"
mkdir -p ${WEB_CONFIG_DIR}
touch ${WEB_CONFIG_FILE}
cat /dev/null >| ${WEB_CONFIG_FILE}

# defaults lifted from https://github.com/ViaVersion/VIAaaS/blob/master/src/main/resources/web/js/config.js
[[ -z "${AZURE_CLIENT_ID}" ]] && parsedClientId='a370fff9-7648-4dbf-b96e-2b4f8d539ac2' || parsedClientId="${AZURE_CLIENT_ID}"
[[ -z "${WHITELISTED_ORIGINS}" ]] && parsedOrigins='https://via.re.yt.nom.br' || parsedOrigins="${WHITELISTED_ORIGINS}"
[[ -z "${CORS_PROXY}" ]] && parsedProxy='https://cors.re.yt.nom.br/' || parsedProxy="${CORS_PROXY}"
[[ -z "${INSTANCE_SUFFIX}" ]] && parsedSuffix='null' || parsedSuffix="\"${INSTANCE_SUFFIX}\""

# write to config file
echo "const azureClientId = \"${parsedClientId}\";" >> ${WEB_CONFIG_FILE}

echo -n "const whitelistedOrigin = [" >> ${WEB_CONFIG_FILE}

IFS='
'
count=0
for origin in ${parsedOrigins}
do
  if [ ${count} -ne 0 ]; then
    echo -n "," >> ${WEB_CONFIG_FILE}
  fi
  echo -n "\"$(echo ${origin} | xargs echo -n)\"" >> ${WEB_CONFIG_FILE}
  count=$((count+1))
done

echo "];" >> ${WEB_CONFIG_FILE}

echo "var defaultCorsProxy = \"${parsedProxy}\";" >> ${WEB_CONFIG_FILE}
echo "var defaultInstanceSuffix = ${parsedSuffix};" >> ${WEB_CONFIG_FILE}
