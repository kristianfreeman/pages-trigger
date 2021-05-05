#!/bin/bash

if [[ -z "$REPO" ]]; then
  echo "Missing REPO: e.g. 'signalnerve/pages-trigger'" 1>&2
  exit 1
fi

if [[ -z "$GITHUB_TOKEN" ]]; then
  echo "Missing GITHUB_TOKEN: a GitHub Personal Access Token with repo permissions" 1>&2
  exit 1
fi

if [[ -z "$PROJECT_NAME" ]]; then
  echo "Missing PROJECT_NAME: a Cloudflare Pages project name to deploy" 1>&2
  exit 1
fi

curl "https://api.github.com/repos/$REPO/dispatches" \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token $GITHUB_TOKEN" \
  -d "{\"event_type\":\"Repository Dispatch\", \"client_payload\": { \"project_name\": \"$PROJECT_NAME\" }}"