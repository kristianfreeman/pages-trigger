#!/bin/bash

if [[ -z "$CF_ACCOUNT_ID" ]]; then
  echo "Missing CF_ACCOUNT_ID" 1>&2
  exit 1
fi

if [[ -z "$CF_API_KEY" ]]; then
  echo "Missing CF_API_KEY" 1>&2
  exit 1
fi

if [[ -z "$CF_EMAIL" ]]; then
  echo "Missing CF_EMAIL" 1>&2
  exit 1
fi

if [[ -z "$PROJECT_NAME" ]]; then
  echo "Missing PROJECT_NAME" 1>&2
  exit 1
fi

curl "https://api.cloudflare.com/client/v4/accounts/$CF_ACCOUNT_ID/pages/projects/$PROJECT_NAME/deployments" \
  -X POST \
  -s -o /dev/null \
  --header "X-Auth-Email: $CF_EMAIL" \
  --header "X-Auth-Key: $CF_API_KEY"