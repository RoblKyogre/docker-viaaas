#!/usr/bin/bash

WEB_CONFIG_DIR=/app/config/web/js
WEB_CONFIG_FILE=${WEB_CONFIG_DIR}/config.js

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
echo "const whitelistedOrigin = [ \"${parsedOrigins}\" ];" >> ${WEB_CONFIG_FILE} # TODO: Support multiple origins
echo "var defaultCorsProxy = \"${parsedProxy}\";" >> ${WEB_CONFIG_FILE}
echo "var defaultInstanceSuffix = ${parsedSuffix};" >> ${WEB_CONFIG_FILE}
