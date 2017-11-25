#!/bin/bash

query="$@"

curl \
    --get \
    --data-urlencode "q=${query} repo:github/services in:title type:issue state:open" \
    --header "authorization: token $GITHUB_TOKEN" \
    --url https://api.github.com/search/issues | \
jq '{items: [.items[] | {title: .title, subtitle: ("#" + (.number | tostring)), arg: .html_url}]}'
