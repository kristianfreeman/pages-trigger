#!/bin/bash

curl "https://api.cloudflare.com/client/v4/accounts/$CF_ACCOUNT_ID/pages/projects/$PROJECT_NAME/deployments" \
  -X POST \
  -s -o /dev/null \
  --header "X-Auth-Email: $CF_EMAIL" \
  --header "X-Auth-Key: $CF_API_KEY"