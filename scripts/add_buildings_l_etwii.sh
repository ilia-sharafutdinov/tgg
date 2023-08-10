#!/bin/bash

rm -rf startpos
rm -rf regions
rm -f startpos.esf
rm -f regions.esf
cp -rf template_startpos startpos
cp -rf template_regions regions

echo ============tatariya============
python3 add_building_slot.py -u -g governors_mansion -b military_academy tatariya settlement_army-admin
python3 add_building_slot.py -b gunnery_school tatariya settlement_ordnance

echo ============arkhangelsk============
python3 add_building_slot.py -u -g governors_mansion -b military_academy arkhangelsk settlement_army-admin

echo ============astrakhan============
python3 add_building_slot.py -u -g governors_mansion -b military_academy astrakhan settlement_army-admin

echo ============hindustan============
python3 add_building_slot.py -b naval_board hindustan settlement_navy-admin

echo ============denmark============
python3 add_building_slot.py -b naval_board denmark settlement_navy-admin

echo ============new_andalusia============
python3 add_building_slot.py -b naval_board new_andalusia settlement_navy-admin

echo ============cuba============
python3 add_building_slot.py -u -g governors_mansion -b military_academy cuba settlement_army-admin
python3 add_building_slot.py -b gunnery_school cuba settlement_ordnance

echo ============iroquois_territory============
python3 add_building_slot.py -u -g governors_mansion -b military_academy iroquois_territory settlement_army-admin
python3 add_building_slot.py -b gunnery_school iroquois_territory settlement_ordnance

echo ============huron_territory============
python3 add_building_slot.py -u -g governors_mansion -b military_academy huron_territory settlement_army-admin
python3 add_building_slot.py -b gunnery_school huron_territory settlement_ordnance

echo ============cherokee_territory============
python3 add_building_slot.py -u -g governors_mansion -b military_academy cherokee_territory settlement_army-admin
python3 add_building_slot.py -b gunnery_school cherokee_territory settlement_ordnance

echo ============serbia============
python3 add_building_slot.py -u -g governors_mansion -b military_academy serbia settlement_army-admin
python3 add_building_slot.py -b gunnery_school serbia settlement_ordnance

echo ============tejas============
python3 add_building_slot.py -u -g governors_mansion -b military_academy tejas settlement_army-admin
python3 add_building_slot.py -b gunnery_school tejas settlement_ordnance

echo ============savoy============
python3 add_building_slot.py -u -g governors_mansion -b military_academy savoy settlement_army-admin
python3 add_building_slot.py -b gunnery_school savoy settlement_ordnance

echo ============labrador============
python3 add_building_slot.py -u -g governors_mansion -b military_academy labrador settlement_army-admin

echo ============alsace============
python3 add_building_slot.py -u -g governors_mansion -b military_academy alsace settlement_army-admin
python3 add_building_slot.py -b gunnery_school alsace settlement_ordnance

echo ============carolinas============
python3 add_building_slot.py -u -g governors_mansion -b military_academy carolinas settlement_army-admin

echo ============chechenya-dagestan============
python3 add_building_slot.py -u -g governors_mansion -b military_academy chechenya-dagestan settlement_army-admin

echo ============courland============
python3 add_building_slot.py -u -g governors_mansion -b military_academy courland settlement_army-admin

echo ============crimea============
python3 add_building_slot.py -u -g governors_mansion -b military_academy crimea settlement_army-admin
python3 add_building_slot.py -b gunnery_school crimea settlement_ordnance

echo ============flanders============
python3 add_building_slot.py -u -g governors_mansion -b military_academy flanders settlement_army-admin
python3 add_building_slot.py -b gunnery_school flanders settlement_ordnance
python3 add_building_slot.py -b opera_house flanders settlement_culture

echo ============genoa============
python3 add_building_slot.py -u -g governors_mansion -b military_academy genoa settlement_army-admin
python3 add_building_slot.py -b gunnery_school genoa settlement_ordnance

echo ============georgia============
python3 add_building_slot.py -u -g governors_mansion -b military_academy georgia settlement_army-admin
python3 add_building_slot.py -b gunnery_school georgia settlement_ordnance

echo ============hannover============
python3 add_building_slot.py -u -g governors_mansion -b military_academy hannover settlement_army-admin
python3 add_building_slot.py -b gunnery_school hannover settlement_ordnance

echo ============lower_louisiana============
python3 add_building_slot.py -u -g governors_mansion -b military_academy lower_louisiana settlement_army-admin
python3 add_building_slot.py -b gunnery_school lower_louisiana settlement_ordnance
python3 add_building_slot.py -b opera_house lower_louisiana settlement_culture

echo ============maine============
python3 add_building_slot.py -u -g governors_mansion -b military_academy maine settlement_army-admin

echo ============malta============
python3 add_building_slot.py -u -g governors_mansion -b military_academy malta settlement_army-admin

echo ============maryland============
python3 add_building_slot.py -u -g governors_mansion -b military_academy maryland settlement_army-admin

echo ============milan============
python3 add_building_slot.py -u -g governors_mansion -b military_academy milan settlement_army-admin
python3 add_building_slot.py -b gunnery_school milan settlement_ordnance
python3 add_building_slot.py -b opera_house milan settlement_culture

echo ============naples============
python3 add_building_slot.py -u -g governors_mansion -b military_academy naples settlement_army-admin
python3 add_building_slot.py -b gunnery_school naples settlement_ordnance
python3 add_building_slot.py -b opera_house naples settlement_culture
python3 add_building_slot.py -b naval_board naples settlement_navy-admin

echo ============new_york============
python3 add_building_slot.py -u -g governors_mansion -b military_academy new_york settlement_army-admin

echo ============rhineland============
python3 add_building_slot.py -u -g governors_mansion -b military_academy rhineland settlement_army-admin
python3 add_building_slot.py -b gunnery_school rhineland settlement_ordnance
python3 add_building_slot.py -b opera_house rhineland settlement_culture

echo ============virginia============
python3 add_building_slot.py -u -g governors_mansion -b military_academy virginia settlement_army-admin

echo ============wurttemberg============
python3 add_building_slot.py -u -g governors_mansion -b military_academy wurttemberg settlement_army-admin
python3 add_building_slot.py -b gunnery_school wurttemberg settlement_ordnance
python3 add_building_slot.py -b opera_house wurttemberg settlement_culture

echo ============COMPILING ESF============
~/GitHub/etwng/esfxml/xml2esf startpos startpos.esf
~/GitHub/etwng/esfxml/xml2esf regions regions.esf
