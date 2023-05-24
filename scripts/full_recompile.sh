#!/bin/bash

shopt -s extglob

echo ============PREPARATIONS============

echo Clearing bin and dist folders.
rm -rf ~/GitHub/tgg/bin/compilated
rm -rf ~/GitHub/tgg/bin/compiled
rm -rf ~/GitHub/tgg/dist/!('README.md')

echo ============PACKS============ && \
python3 ~/GitHub/tgg/scripts/packs.py && \
echo ============MAPS============ && \
python3 ~/GitHub/tgg/scripts/maps.py && \
echo ============CAMPAIGNS============ && \
python3 ~/GitHub/tgg/scripts/campaigns.py && \
echo ============INSTALL============ && \
python3 ~/GitHub/tgg/scripts/install.py && \
echo ============MAKE_PDF============ && \
python3 ~/GitHub/tgg/scripts/make_pdf.py && \
echo ============ZIP============ && \
rsync -rlpgoD --exclude README.md ~/GitHub/tgg/bin/compiled/ ~/GitHub/tgg/dist && \
rsync -rlpgoD --exclude README.md ~/GitHub/tgg/lib/ ~/GitHub/tgg/dist && \
python3 ~/GitHub/tgg/scripts/zip.py

echo ============COMPLETED============
