#!/bin/bash

set -e

#
# GENERATE JSON GROOVY SCRIPT
#
# see: https://books.sonatype.com/nexus-book/reference3/scripting.html#scripting-configuration
# Creates several Proxy Repositories and one Repository Group that
# contains all repos and 'maven-central' which is pre configured
JSON_PREFIX='{ "name": "create-proxy-repositories", "type": "groovy", "content": "'
JSON_POSTFIX='" }'
GROOVY_SCRIPT_ONE_LINER=$(j2 proxy-respository-script.jinja2 proxy-repositories.json | tr '\n' ' ')
echo $JSON_PREFIX$GROOVY_SCRIPT_ONE_LINER$JSON_POSTFIX > _tmp.create-proxy-repositories.json

echo "==================================="
echo "SCRIPT TO CREATE PROXY REPOS AND REPO GROUP:"
cat _tmp.create-proxy-repositories.json
echo "==================================="



#
# UPLOAD SCRIPT
#
curl -v \
    -X POST \
    -u $NEXUS_AUTH \
    --header "Content-Type: application/json" \
    "${NEXUS_BASE_URL}/service/siesta/rest/v1/script" \
    -d @./_tmp.create-proxy-repositories.json

#
# RUN
#
curl -v \
    -X POST \
    -u $NEXUS_AUTH \
    --header "Content-Type: text/plain" \
    "${NEXUS_BASE_URL}/service/siesta/rest/v1/script/create-proxy-repositories/run"

#
# CLEANUP
#
curl -v \
    -X DELETE \
    -u $NEXUS_AUTH \
    "${NEXUS_BASE_URL}/service/siesta/rest/v1/script/create-proxy-repositories"
