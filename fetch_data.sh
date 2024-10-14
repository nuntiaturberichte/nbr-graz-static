#!/bin/bash

echo "Fetching transcriptions from data_repo"

# Lösche und erstelle neue Verzeichnisse für die Daten
rm -rf data/editions && mkdir -p data/editions
rm -rf data/fronts && mkdir -p data/fronts
rm -rf data/meta && mkdir -p data/meta
rm -rf data/mets && mkdir -p data/mets
rm -rf data/register && mkdir -p data/register

# Lade das Repository als ZIP-Archiv herunter
curl -LO https://github.com/nuntiaturberichte/nbr-graz-data/archive/refs/heads/main.zip

# Entpacke das heruntergeladene ZIP-Archiv
unzip main.zip

# Verschiebe die benötigten Ordner aus dem tieferen Verzeichnis in die entsprechenden Verzeichnisse unter "data"
mv ./nbr-graz-data-main/nbr-graz-data-main/editions/* ./data/editions/
mv ./nbr-graz-data-main/nbr-graz-data-main/meta/* ./data/meta/
mv ./nbr-graz-data-main/nbr-graz-data-main/mets/* ./data/mets/
mv ./nbr-graz-data-main/nbr-graz-data-main/register/* ./data/register/

# Bereinige: Lösche das heruntergeladene ZIP-Archiv und das entpackte Verzeichnis
rm main.zip
rm -rf ./nbr-graz-data-main

echo "Transcriptions have been successfully updated."