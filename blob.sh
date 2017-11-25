#!/bin/bash

sha=d2ebbe6c5ae6818670df464a3d8d9217158359da

curl \
  --get \
  --header "authorization: token $GITHUB_TOKEN" \
  --url "https://api.github.com/repos/swinton/canned-replies/git/blobs/$sha" |  \
jq --raw-output '.content' | \
python2.7 -c "import sys, base64 as b64; print b64.b64decode(sys.stdin.read());"
