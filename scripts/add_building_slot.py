import argparse
import os
import re
from bs4 import BeautifulSoup


coordinates_deltas = {
    2: {
        1: (0.45486068725603, 0.390426635742017),
        2: (-0.353293418883993, -0.403335571289972),
        'road': (0.570739746094034, -0.571044921875),
        'walls': (-0.575134277343977, 0.575103759765)
    },
    3: {
        1: (0.854919433593977, -0.002685546875),
        2: (-0.746658325195028, -0.0039978027339771),
        3: (0.0548095703130116, 0.783599853516023),
        'road': (0.570739746093977, -0.571014404296989),
        'walls': (-0.575134277343011, 0.575134277344034)
    },
    4: {
        1: (0.0400695800790061, -0.802642822265966),
        2: (0.0548095703130116, 0.783569335938012),
        3: (0.854919433594006, -0.00271606445301131),
        4: (-0.746658325195, -0.00402832031198841),
        'road': (-0.910568237304005, -0.994171142578011),
        'walls': (1.048583984375, 1.01593017578102)
    },
    5: {
        1: (0.0030517578125, -0.008891105652026),
        2: (-0.761548042297392, 0.755708694458008),
        3: (0.781751632690401, 0.769708633421999),
        4: (0.777251243591309, -0.783190727234),
        5: (-0.771348953247099, -0.783290863038019),
        'road': (0.0383510589599041, -1.33039093017601),
        'walls': (0.0383510589599041, 1.32590866088799)
    }
}

def read_xml(xml_path):
    with open(xml_path, 'r') as file:
        content = file.readlines()
    content = '<pre>' + ''.join(content) + '</pre>'
    soup = BeautifulSoup(content, 'lxml')
    return soup

def write_xml(xml_path, soup):
    formatted_output = str(soup)
    formatted_output = formatted_output.replace('<html><body><pre>', '')
    formatted_output = formatted_output.replace('</pre></body></html>', '')
    formatted_output = re.sub('\>\<\/\w+\>', '/>', formatted_output)
    formatted_output = re.sub('\n +\n', '\n', formatted_output)
    with open(xml_path, 'w') as file:
        file.write(formatted_output)

def found_in_all_files(rootdir, string, warn=True, return_first_name=False):
    found = False
    for root, dirs, files in os.walk(rootdir):
        for name in files:
            if not name.endswith('.pgm'):
                with open(os.path.join(root, name), 'r') as file:
                    if str(string) in ''.join(file.readlines()):
                        found = True
                        if warn:
                            print(f'WARNING: {string} found in {name}.')
                        if return_first_name:
                            return name
    return found

def remove_building(soup):
    if soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}).find('rec', {'type': 'REGION_SLOT'}).find('rec', {'type': 'BUILDING_MANAGER'}).find('yes'):
        soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}).find('rec', {'type': 'REGION_SLOT'}).find('rec', {'type': 'BUILDING_MANAGER'}).find('yes').name = 'no'
        soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}).find('rec', {'type': 'REGION_SLOT'}).find('rec', {'type': 'BUILDING_MANAGER'}).find('building').extract()
    return soup

def add_building(soup, new_building, faction, government):
    soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}).find('rec', {'type': 'REGION_SLOT'}).find('rec', {'type': 'BUILDING_MANAGER'}).find('no').name = 'yes'
    building_manager = soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}).find('rec', {'type': 'REGION_SLOT'}).find('rec', {'type': 'BUILDING_MANAGER'})
    building_manager.insert(2, '\n   ')
    building_manager.insert(3, soup.new_tag('building', attrs={'health': '100', 'name': new_building, 'faction': faction, 'government': government}))
    return soup

def change_coordinates(soup, base_coordinates, n_slots, slot_n):
    x_new = str(base_coordinates[0] + coordinates_deltas[n_slots][slot_n][0])
    y_new = str(base_coordinates[1] + coordinates_deltas[n_slots][slot_n][1])
    if slot_n == 'road':
        soup.find('rec', {'type': 'ROAD_SLOT'}).find('rec', {'type': 'REGION_SLOT'}).find('v2x', recursive=False)['x'] = x_new
        soup.find('rec', {'type': 'ROAD_SLOT'}).find('rec', {'type': 'REGION_SLOT'}).find('v2x', recursive=False)['y'] = y_new
    elif slot_n == 'walls':
        soup.find('rec', {'type': 'FORTIFICATION_SLOT'}).find('rec', {'type': 'REGION_SLOT'}).find('v2x', recursive=False)['x'] = x_new
        soup.find('rec', {'type': 'FORTIFICATION_SLOT'}).find('rec', {'type': 'REGION_SLOT'}).find('v2x', recursive=False)['y'] = y_new
    else:
        soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}).find('rec', {'type': 'REGION_SLOT'}).find('v2x', recursive=False)['x'] = x_new
        soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}).find('rec', {'type': 'REGION_SLOT'}).find('v2x', recursive=False)['y'] = y_new
    return soup

def get_base_coordinates(soup):
    x_base = soup.find('rec', {'type': 'SETTLEMENT'}).find('rec', {'type': 'SIEGEABLE_GARRISON_RESIDENCE'}).find('v2x', recursive=False)['x']
    y_base = soup.find('rec', {'type': 'SETTLEMENT'}).find('rec', {'type': 'SIEGEABLE_GARRISON_RESIDENCE'}).find('v2x', recursive=False)['y']
    return (float(x_base), float(y_base))

parser = argparse.ArgumentParser()
parser.add_argument('region', type=str, help='Region readable name in lowercase, such as "savoy".')
parser.add_argument('new_slot', type=str, help='A building slot type you wish to add, such as "settlement_army-admin". IMPORTANT: You should not add a slot type which already exists in the settlement.')
parser.add_argument('-s', '--unpacked_startpos_esf_path', default='startpos', type=str, help='Path to startpos.esf, unpacked using taw\'s esf2xml. Default is "startpos".')
parser.add_argument('-r', '--unpacked_regions_esf_path', default='regions', type=str, help='Path to egions.esf, unpacked using taw\'s esf2xml. Default is "regions".')
parser.add_argument('-k', '--keep_bdi', action='store_true', help='Keeps the BDI intact for the new cai_building_slots record. Works well with the latest vanilla startpos. WARNING: Crashes on some startpos files.')
parser.add_argument('-u', '--upgrade_minor_to_major', action='store_true', help='Replaces "settlement_minor" building slot with "settlement_government". IMPORTANT: You should only do it once.')
parser.add_argument('-g', '--new_government_building', type=str, help='A building you wish to construct in the government slot. Default is none.')
parser.add_argument('-b', '--new_building', type=str, help='A building you wish to construct in the new slot. Default is none.')
parser.add_argument('-v', '--verbose', action='store_true', help='Print existing ID warnings.')
args = parser.parse_args()

region = args.region
new_slot = args.new_slot
unpacked_startpos_esf_path = args.unpacked_startpos_esf_path
unpacked_regions_esf_path = args.unpacked_regions_esf_path
new_building = args.new_building
new_government_building = args.new_government_building
keep_bdi = args.keep_bdi
upgrade_minor_to_major = args.upgrade_minor_to_major
verbose = args.verbose




# CHANGING region

region_xml_path = os.path.join(unpacked_startpos_esf_path, 'region', f'{region}.xml')

region_soup = read_xml(region_xml_path)

controlling_faction_id = region_soup.find('rec', {'type': 'REGION'}).findAll('u')[9].string

settlement = region_soup.find('rec', {'type': 'REGION'}).findAll('xml_include', recursive=False)[1].get('path').replace(f'region_slot/settlement-{region}-', '').replace('.xml', '')

region_slot_array = region_soup.find('rec', {'type': 'REGION'}).find('rec', {'type': 'REGION_SLOT_MANAGER'}).find('ary', {'type': 'REGION_SLOT_ARRAY'})
region_slots = [i for i in region_slot_array.findAll('xml_include') if 'region_slot/settlement' in i.get('path')]
n_slots = len(region_slots)

# Adding new xml_include to REGION_SLOT_ARRAY

region_slot_array.insert(n_slots * 2, '\n   ')
region_slot_array.insert(n_slots * 2 + 1, region_soup.new_tag('xml_include', attrs={'path': f'region_slot/settlement-{region}-{settlement}-{new_slot}.xml'}))




# COLLECTING INFO

faction_file_name = found_in_all_files(os.path.join(unpacked_startpos_esf_path, 'factions'), f'>{controlling_faction_id}<', warn=False, return_first_name=True)

faction_xml_path = os.path.join(unpacked_startpos_esf_path, 'factions', faction_file_name)

faction_soup = read_xml(faction_xml_path)

faction = faction_soup.find('rec', {'type': 'FACTION'}).find('rec', {'type': 'CAMPAIGN_PLAYER_SETUP'}).find('s', recursive=False).string

government = [i for i in os.listdir(os.path.join(unpacked_startpos_esf_path, 'government')) if i.startswith(f'{faction}-')][0].replace(f'{faction}-', '').replace('.xml', '')

base_region_slot_xml_path = os.path.join(unpacked_startpos_esf_path, 'region_slot', f'settlement-{region}-{settlement}.xml')

base_region_slot_soup = read_xml(base_region_slot_xml_path)

base_coordinates = get_base_coordinates(base_region_slot_soup)




# CHANGING COORDINATES

coordinates_changes = {}
for i, region_slot in enumerate(region_slots):
    existing_region_slot_xml_path = os.path.join(unpacked_startpos_esf_path, *region_slot.get('path').split('/'))
    existing_region_slot_soup = read_xml(existing_region_slot_xml_path)
    existing_region_slot_soup = change_coordinates(existing_region_slot_soup, base_coordinates, n_slots + 1, i + 1)
    coordinates_changes[existing_region_slot_xml_path] = existing_region_slot_soup
for region_slot in ['road', 'walls']:
    existing_region_slot_xml_path = os.path.join(unpacked_startpos_esf_path, 'region_slot', f'{region}-{region_slot}.xml')
    existing_region_slot_soup = read_xml(existing_region_slot_xml_path)
    existing_region_slot_soup = change_coordinates(existing_region_slot_soup, base_coordinates, n_slots + 1, region_slot)
    coordinates_changes[existing_region_slot_xml_path] = existing_region_slot_soup




# ADDING NEW region_slot

template_region_slot_xml_path = os.path.join(unpacked_startpos_esf_path, *region_slots[0].get('path').split('/'))

new_region_slot_xml_path = os.path.join(os.path.dirname(template_region_slot_xml_path), f'settlement-{region}-{settlement}-{new_slot}.xml')

new_region_slot_soup = read_xml(template_region_slot_xml_path)

template_building_slot_id = int(new_region_slot_soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}) \
    .find('rec', {'type': 'REGION_SLOT'}) \
        .find('rec', {'type': 'SIEGEABLE_GARRISON_RESIDENCE'}) \
            .find('u').string)

new_building_slot_id = template_building_slot_id + 1

while found_in_all_files(unpacked_startpos_esf_path, f'>{new_building_slot_id}<', warn=verbose):
    new_building_slot_id += 1

# Changing coordinates
new_region_slot_soup = change_coordinates(new_region_slot_soup, base_coordinates, n_slots + 1, n_slots + 1)

# Changing SIEGEABLE_GARRISON_RESIDENCE Building Slot ID
new_region_slot_soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}) \
    .find('rec', {'type': 'REGION_SLOT'}) \
        .find('rec', {'type': 'SIEGEABLE_GARRISON_RESIDENCE'}) \
            .find('u').string = str(new_building_slot_id)

# Removing building (if present)
new_region_slot_soup = remove_building(new_region_slot_soup)

# Adding new building (if needed)
if new_building:
    new_region_slot_soup = add_building(new_region_slot_soup, new_building, faction, government)

# Changing Building Slot ID
new_region_slot_soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}).find('rec', {'type': 'REGION_SLOT'}).find('u', recursive=False).string = str(new_building_slot_id)

# Changing Building Slot Name
new_region_slot_soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}).find('rec', {'type': 'REGION_SLOT'}).find('s', recursive=False).string = \
':'.join(new_region_slot_soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}).find('rec', {'type': 'REGION_SLOT'}).find('s', recursive=False).string.split(':')[:-1] + [new_slot])




# CHANGING settlement_minor

if upgrade_minor_to_major:
    government_region_slot_soup = read_xml(template_region_slot_xml_path)

    government_region_slot_soup = change_coordinates(government_region_slot_soup, base_coordinates, n_slots + 1, 1)

    government_region_slot_soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}).find('rec', {'type': 'REGION_SLOT'}).find('s').string = \
    government_region_slot_soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}).find('rec', {'type': 'REGION_SLOT'}).find('s').string.replace('settlement_minor', 'settlement_government')

    government_region_slot_soup = remove_building(government_region_slot_soup)

    if new_government_building:
        government_region_slot_soup = add_building(government_region_slot_soup, new_government_building, faction, government)




# CHANGING cai_world

cai_world_xml_path = os.path.join(unpacked_startpos_esf_path, 'cai_interface', 'cai_world.xml')

cai_world_soup = read_xml(cai_world_xml_path)

cai_world_slot_array = cai_world_soup.find('rec', {'type': 'CAI_WORLD'}) \
    .find('ary', {'type': 'CAI_WORLD_BUILDING_SLOTS'})

cai_world_building_slots = cai_world_slot_array.findAll('xml_include')
n_cai_slots = len(cai_world_building_slots)
new_cai_building_slot_name = int(cai_world_building_slots[-1].get('path').split('/')[-1].split('.')[0]) + 1

# Adding new xml_include to CAI_WORLD_BUILDING_SLOTS

cai_world_slot_array.insert(n_cai_slots * 2, '\n  ')
cai_world_slot_array.insert(n_cai_slots * 2 + 1, cai_world_soup.new_tag('xml_include', attrs={'path': f'cai_building_slots/{new_cai_building_slot_name}.xml'}))




# ADDING NEW cai_building_slots

template_name = found_in_all_files(os.path.join(unpacked_startpos_esf_path, 'cai_building_slots'), f'>{template_building_slot_id}<', warn=False, return_first_name=True)

template_cai_building_slot_xml_path = os.path.join(unpacked_startpos_esf_path, 'cai_building_slots', template_name)

new_cai_building_slot_xml_path = os.path.join(unpacked_startpos_esf_path, 'cai_building_slots', f'{new_cai_building_slot_name}.xml')

new_cai_building_slot_soup = read_xml(template_cai_building_slot_xml_path)

template_building_slot_ai_id = new_cai_building_slot_soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).find('u', recursive=False).string
new_building_slot_ai_id = int('100' + template_building_slot_ai_id)

while found_in_all_files(unpacked_startpos_esf_path, f'{new_building_slot_ai_id}', warn=verbose):
    new_building_slot_ai_id += 10000

# Changing Building Slot AI ID
new_cai_building_slot_soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).find('u', recursive=False).string = str(new_building_slot_ai_id)

# Changing BDI
new_cai_building_slot_soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).findAll('u4_ary', recursive=False)[1].string = ''
if keep_bdi:
    new_cai_building_slot_soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).findAll('u4_ary', recursive=False)[3].string = \
    new_cai_building_slot_soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).findAll('u4_ary', recursive=False)[3].string.split(' ')[-1]
else:
    new_cai_building_slot_soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).findAll('u4_ary', recursive=False)[3].string = ''
new_cai_building_slot_soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).findAll('u4_ary', recursive=False)[7].string = ''

# Changing Building Slot ID
new_cai_building_slot_soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).find('rec', {'type': 'CAI_BUILDING_SLOT'}).find('u', recursive=False).string = str(new_building_slot_id)




# CHANGING cai_settlement

settlement_xml_path = os.path.join(unpacked_startpos_esf_path, 'region_slot', f'settlement-{region}-{settlement}.xml')

settlement_soup = read_xml(settlement_xml_path)

settlement_id = settlement_soup.find('rec', {'type': 'SETTLEMENT'}).findAll('i', recursive=False)[1].string

cai_settlement_file_name = found_in_all_files(os.path.join(unpacked_startpos_esf_path, 'cai_settlements'), f'>{settlement_id}<', warn=False, return_first_name=True)

cai_settlement_xml_path = os.path.join(unpacked_startpos_esf_path, 'cai_settlements', cai_settlement_file_name)

settlement_soup = read_xml(cai_settlement_xml_path)

settlement_soup.find('rec', {'type': 'CAI_WORLD_SETTLEMENTS'}).find('rec', {'type': 'CAI_SETTLEMENT'}).find('u4_ary').string = \
str(new_building_slot_ai_id) + ' ' + settlement_soup.find('rec', {'type': 'CAI_WORLD_SETTLEMENTS'}).find('rec', {'type': 'CAI_SETTLEMENT'}).find('u4_ary').string




# CHANGING regions-1

regions1_xml_path = os.path.join(unpacked_regions_esf_path, 'regions-1', f'{region}.xml')

regions1_soup = read_xml(regions1_xml_path)

regions1_slot_array = regions1_soup.find('rec', {'type': 'regions'}) \
    .find('ary', {'type': 'slot_descriptions'})

regions1_slots = [i for i in regions1_slot_array.findAll('xml_include') if 'slot/settlement' in i.get('path') and not 'fortification' in i.get('path') and not 'road' in i.get('path')]
regions1_n_slots = len(regions1_slots)

# Adding new xml_include to REGION_SLOT_ARRAY

regions1_slot_array.insert(regions1_n_slots * 2, '\n   ')
regions1_slot_array.insert(regions1_n_slots * 2 + 1, regions1_soup.new_tag('xml_include', attrs={'path': f'slot/settlement-{region}-{settlement}-{new_slot}.xml'}))




# ADDING NEW map regions slot

template_regions1_slot_xml_path = os.path.join(unpacked_regions_esf_path, *regions1_slots[0].get('path').split('/'))

new_regions1_slot_xml_path = os.path.join(os.path.dirname(template_regions1_slot_xml_path), f'settlement-{region}-{settlement}-{new_slot}.xml')

new_regions1_slot_soup = read_xml(template_regions1_slot_xml_path)

# Changing Building Slot Name
new_regions1_slot_soup.find('rec', {'type': 'slot_descriptions'}).find('s', recursive=False).string = \
':'.join(new_regions1_slot_soup.find('rec', {'type': 'slot_descriptions'}).find('s', recursive=False).string.split(':')[:-1] + [new_slot])
new_regions1_slot_soup.find('rec', {'type': 'slot_descriptions'}).findAll('s', recursive=False)[1].string = new_slot




# CHANGING settlement_minor

if upgrade_minor_to_major:
    government_regions1_slot_soup = read_xml(template_regions1_slot_xml_path)

    # Changing Building Slot Name
    government_regions1_slot_soup.find('rec', {'type': 'slot_descriptions'}).find('s', recursive=False).string = \
    government_regions1_slot_soup.find('rec', {'type': 'slot_descriptions'}).find('s', recursive=False).string.replace('settlement_minor', 'settlement_government')
    government_regions1_slot_soup.find('rec', {'type': 'slot_descriptions'}).findAll('s', recursive=False)[1].string = 'settlement_government'




# APPLYING CHANGES

write_xml(region_xml_path, region_soup)
write_xml(new_region_slot_xml_path, new_region_slot_soup)
write_xml(cai_world_xml_path, cai_world_soup)
write_xml(new_cai_building_slot_xml_path, new_cai_building_slot_soup)
write_xml(cai_settlement_xml_path, settlement_soup)
for existing_region_slot_xml_path, existing_region_slot_soup in coordinates_changes.items():
    write_xml(existing_region_slot_xml_path, existing_region_slot_soup)
if upgrade_minor_to_major:
    write_xml(template_region_slot_xml_path, government_region_slot_soup)

write_xml(regions1_xml_path, regions1_soup)
write_xml(new_regions1_slot_xml_path, new_regions1_slot_soup)
if upgrade_minor_to_major:
    write_xml(template_regions1_slot_xml_path, government_regions1_slot_soup)

# DONE

print(f'{region} + {new_slot}'
      + f', n_slots: {n_slots} -> {n_slots + 1}'
      + f', new_building_slot_id: {template_building_slot_id} -> {new_building_slot_id}'
      + f', new_building_slot_ai_id: {template_building_slot_ai_id} -> {new_building_slot_ai_id}'
      + (f', new_building: {new_building}' if new_building else '')
      + (f', minor_to_major: {upgrade_minor_to_major}' if upgrade_minor_to_major else '')
      + (f', new_government_building: {new_government_building}' if new_government_building else ''))
