#!/bin/bash

echo "Fetching transcriptions from data_repo"

# Lösche und erstelle neue Verzeichnisse für die Daten
rm -rf data/ && mkdir data

# Lade das Repository als ZIP-Archiv herunter
curl -LO https://github.com/nuntiaturberichte/nbr-graz-data/archive/refs/heads/main.zip

# Entpacke das heruntergeladene ZIP-Archiv
unzip main.zip

# # Verschiebe die benötigten Ordner aus dem tieferen Verzeichnis in die entsprechenden Verzeichnisse unter "data"
mv ./nbr-graz-data-main/* ./data


# # Bereinige: Lösche das heruntergeladene ZIP-Archiv und das entpackte Verzeichnis
rm main.zip
rm -rf ./nbr-graz-data-main

echo "Transcriptions have been successfully updated."

echo "fetching imprint"
./shellscripts/dl_imprint.sh