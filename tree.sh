#!/bin/bash

query="$@"

curl \
  --get \
  --header "authorization: token $GITHUB_TOKEN" \
  --url https://api.github.com/repos/swinton/canned-replies/git/trees/master | \
jq '{items: [.tree[] | {title: .path, subtitle: .type, arg: .sha}]}'

# d2ebbe6c5ae6818670df464a3d8d9217158359da
