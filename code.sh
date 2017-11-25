#!/bin/bash

curl \
    --get \
    --data-urlencode "q=repo:swinton/canned-replies in:path extension:md path:canned-replies" \
    --header "authorization: token $GITHUB_TOKEN" \
    --url 'https://api.github.com/search/code' | \
jq '{items: [.items[] | {title: .name, subtitle: .path, arg: .sha}]}'
