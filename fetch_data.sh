# bin/bash

echo "fetching transkriptions from data_repo"
rm -rf data/editions && mkdir data/editions
rm -rf data/indices && mkdir data/indices
rm -rf data/meta && mkdir data/meta
curl -LO https://github.com/nuntiaturberichte/nbr-graz-data/data/archive/refs/heads/main.zip
unzip main

mv ./nbr-graz-data/data-main/data/editions/ ./data
mv ./nbr-graz-data/data-main/data/indices/ ./data
mv ./nbr-graz-data/data-main/data/meta/ ./data

rm main.zip
rm -rf ./nbr-graz-data/data-main
