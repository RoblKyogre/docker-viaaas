#!/usr/bin/env bash

set -ex

for SCRIPT_FILE in $(find /scripts -type f -print)
do
	${SCRIPT_FILE}
done

cd /app
exec java -jar VIAaaS-all.jar
