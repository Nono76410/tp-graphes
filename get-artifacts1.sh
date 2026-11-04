#!/usr/bin/env bash

tok=$(cat ./../token.gh)

curl -L \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $tok" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/Nono76410/tp-graphes/actions/artifacts > artifacts1.json

curl -L \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $tok" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    --output artifacts1.zip \
    https://api.github.com/repos/Nono76410/tp-graphes/actions/artifacts/11882876615/zip

unzip artifacts1.zip -d artifacts1