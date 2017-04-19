#!/bin/bash

set -e

#
# GENERATE JSON GROOVY SCRIPT
#
# see: https://books.sonatype.com/nexus-book/reference3/scripting.html#scripting-configuration
JSON_PREFIX='{ "name": "create-proxy-repositories", "type": "groovy", "content": "'
JSON_POSTFIX='" }'
GROOVY_SCRIPT=""
while IFS='' read -r line || [[ -n "$line" ]]; do
    GROOVY_SCRIPT=$GROOVY_SCRIPT'\n repository.createMavenProxy('$line') '
done < "proxy-repositories.txt"
echo $JSON_PREFIX$GROOVY_SCRIPT$JSON_POSTFIX > _tmp.create-proxy-repositories.json

#
# UPLOAD SCRIPT
#
curl -v \
    -X POST \
    -u admin:admin123 \
    --header "Content-Type: application/json" \
    'http://localhost:8333/service/siesta/rest/v1/script' \
    -d @./_tmp.create-proxy-repositories.json

#
# RUN
#
curl -v -X POST -u admin:admin123 --header "Content-Type: text/plain" \
'http://localhost:8333/service/siesta/rest/v1/script/create-proxy-repositories/run'

#
# CLEANUP
#
curl -v -X DELETE -u admin:admin123 'http://localhost:8333/service/siesta/rest/v1/script/create-proxy-repositories'
