#!/bin/bash

# Allow owner/repo syntax
if [[ "$@" =~ ^.+\/.+$ ]]; then
  IFS='/' read -a argv <<< "$@"
  owner="${argv[0]}"
  query="${argv[1]}"
else
  owner="github"
  query="$@"
fi

curl \
    --get \
    --data-urlencode "q=${query} in:name org:${owner}" \
    --data-urlencode "type=Repositories" \
    --header "authorization: token $GITHUB_TOKEN" \
    --url https://api.github.com/search/repositories | \
jq '{items: [.items[] | {title: .name, subtitle: .description, arg: .html_url}]}'
