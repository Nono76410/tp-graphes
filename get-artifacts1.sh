#!/usr/bin/env bash

tok=$(cat ./../token.gh)

curl -L \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer $tok" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    https://api.github.com/repos/Nono76410/tp-graphes/actions/artifacts > artifacts1.json

jq '.artifacts[].id' artifacts1.json > liste_id.txt

idnbr=$(cat liste_id.txt)

for id in $idnbr; do
    echo "Téléchargement de l'artefact ID : $id"
    curl -s -L \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer $tok" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        --output "artifacts_${id}.zip" \
        https://api.github.com/repos/Nono76410/tp-graphes/actions/artifacts/${id}/zip

unzip ./artifacts_${id}.zip -d artifacts_${id}
done



