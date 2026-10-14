#!/usr/bin/env bash

tool=dot

if [[ -z "$1" ]]; then
    echo "Erreur: argument manquant. Utiliser: ./run.sh <nom de fichier dot>"
    exit 1
fi


$tool -Tpng "$1.dot" >"$1.png"
$tool -Tsvg "$1.dot" >"$1.svg"

