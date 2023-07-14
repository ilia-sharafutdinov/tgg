import sys
import shutil
from bs4 import BeautifulSoup
import re
import os


def read_xml(xml_path):
    with open(xml_path, 'r') as file:
        content = file.readlines()
    content = '<pre>' + ''.join(content) + '</pre>'
    soup = BeautifulSoup(content, 'lxml')
    return soup

def write_xml(xml_path, soup):
    formatted_output = re.sub('\>\<\/\w+\>', '/>', str(soup).replace('<html><body><pre>', '').replace('</pre></body></html>', ''))
    with open(xml_path, 'w') as file:
        file.write(formatted_output)

def found_in_all_files(rootdir, string, warn=True, return_first_name=False):
    found = False
    for root, dirs, files in os.walk(rootdir):
        for name in files:
            if not name.endswith('.pgm'):
                with open(os.path.join(root, name), 'r') as file:
                    if string in ''.join(file.readlines()):
                        found = True
                        if warn:
                            print(f'WARNING: {string} found in {name}.')
                        if return_first_name:
                            return name
    return found


region = sys.argv[1]
new_slot = sys.argv[2]

core_dir = os.path.dirname(os.path.dirname(__file__))

startpos_esf_path = os.path.dirname(core_dir, 'src', 'campaigns', 'main', 'startpos')

regions_esf_path = os.path.dirname(core_dir, 'src', 'maps', 'global_map', 'regions')




# CHANGING region

region_xml_path = os.path.join(startpos_esf_path, 'region', f'{region}.xml')

soup = read_xml(region_xml_path)

settlement = soup.find('rec', {'type': 'REGION'}).findAll('xml_include')[1].get('path').split('-')[2]

region_slot_array = soup.find('rec', {'type': 'REGION'}) \
    .find('rec', {'type': 'REGION_SLOT_MANAGER'}) \
        .find('ary', {'type': 'REGION_SLOT_ARRAY'})

region_slots = [i for i in region_slot_array.findAll('xml_include') if 'region_slot/settlement' in i.get('path')]
n_slots = len(region_slots)

# Adding new xml_include to REGION_SLOT_ARRAY

region_slot_array.insert(n_slots * 2, '\n   ')
region_slot_array.insert(n_slots * 2 + 1, soup.new_tag('xml_include', attrs={'path': f'region_slot/settlement-{region}-{settlement}-{new_slot}.xml'}))

write_xml(region_xml_path, soup)




# ADDING NEW region_slot

template_xml_path = os.path.join(startpos_esf_path, *region_slots[0].get('path').split('/'))

new_region_slot_xml_path = os.path.join(*template_xml_path.split('/')[:-1], f'settlement-{region}-{settlement}-{new_slot}.xml')

shutil.copy(template_xml_path, new_region_slot_xml_path)

soup = read_xml(new_region_slot_xml_path)

template_building_slot_id = int(soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}) \
    .find('rec', {'type': 'REGION_SLOT'}) \
        .find('rec', {'type': 'SIEGEABLE_GARRISON_RESIDENCE'}) \
            .find('u').string)

new_building_slot_id = template_building_slot_id + 1

assert not found_in_all_files(startpos_esf_path, f'>{new_building_slot_id}<')

# Changing SIEGEABLE_GARRISON_RESIDENCE Building Slot ID
soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}) \
    .find('rec', {'type': 'REGION_SLOT'}) \
        .find('rec', {'type': 'SIEGEABLE_GARRISON_RESIDENCE'}) \
            .find('u').string = str(new_building_slot_id)

# Removing building (if present)
if soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}) \
    .find('rec', {'type': 'REGION_SLOT'}) \
        .find('rec', {'type': 'BUILDING_MANAGER'}) \
            .find('yes'):

    soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}) \
        .find('rec', {'type': 'REGION_SLOT'}) \
            .find('rec', {'type': 'BUILDING_MANAGER'}) \
                .find('yes').name = 'no'

    soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}) \
        .find('rec', {'type': 'REGION_SLOT'}) \
            .find('rec', {'type': 'BUILDING_MANAGER'}) \
                .find('building') \
                    .extract()

# Changing Building Slot ID
soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}) \
    .find('rec', {'type': 'REGION_SLOT'}) \
        .find('u', recursive=False).string = str(new_building_slot_id)

# Changing Building Slot Name
soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}) \
    .find('rec', {'type': 'REGION_SLOT'}) \
        .find('s', recursive=False).string = \
':'.join(soup.find('rec', {'type': 'REGION_SLOT_ARRAY'}) \
    .find('rec', {'type': 'REGION_SLOT'}) \
        .find('s', recursive=False).string.split(':')[:-1] + [new_slot])

write_xml(new_region_slot_xml_path, soup)




# CHANGING cai_world

cai_world_xml_path = os.path.join(startpos_esf_path, 'cai_interface', 'cai_world.xml')

soup = read_xml(cai_world_xml_path)

cai_world_slot_array = soup.find('rec', {'type': 'CAI_WORLD'}) \
    .find('ary', {'type': 'CAI_WORLD_BUILDING_SLOTS'})

cai_world_building_slots = cai_world_slot_array.findAll('xml_include')
n_cai_slots = len(cai_world_building_slots)
new_cai_building_slot_name = int(cai_world_building_slots[-1].get('path').split('/')[-1].split('.')[0]) + 1

# Adding new xml_include to CAI_WORLD_BUILDING_SLOTS

cai_world_slot_array.insert(n_cai_slots * 2, '\n  ')
cai_world_slot_array.insert(n_cai_slots * 2 + 1, soup.new_tag('xml_include', attrs={'path': f'cai_building_slots/{new_cai_building_slot_name}.xml'}))

write_xml(cai_world_xml_path, soup)




# ADDING NEW region_slot

template_name = found_in_all_files(os.path.join(startpos_esf_path, 'cai_building_slots'), f'>{template_building_slot_id}<', warn=False, return_first_name=True)

template_xml_path = os.path.join(startpos_esf_path, 'cai_building_slots', template_name)

new_cai_building_slot_xml_path = os.path.join(startpos_esf_path, 'cai_building_slots', f'{new_cai_building_slot_name}.xml')

shutil.copy(template_xml_path, new_cai_building_slot_xml_path)

soup = read_xml(new_cai_building_slot_xml_path)

template_building_slot_ai_id = soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).find('u', recursive=False).string
new_building_slot_ai_id = '100' + template_building_slot_ai_id

assert not found_in_all_files(startpos_esf_path, new_building_slot_ai_id)

# Changing Building Slot AI ID
soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).find('u', recursive=False).string = new_building_slot_ai_id

# Changing BDI
soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).findAll('u4_ary', recursive=False)[1].string = ''
soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).findAll('u4_ary', recursive=False)[3].string = \
soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).findAll('u4_ary', recursive=False)[3].string.split(' ')[-1]
soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).findAll('u4_ary', recursive=False)[7].string = ''

# Changing Building Slot ID
soup.find('rec', {'type': 'CAI_WORLD_BUILDING_SLOTS'}).find('rec', {'type': 'CAI_BUILDING_SLOT'}).find('u', recursive=False).string = str(new_building_slot_id)

write_xml(new_cai_building_slot_xml_path, soup)




# CHANGING cai_settlement

settlement_xml_path = os.path.join(startpos_esf_path, 'region_slot', f'settlement-{region}-{settlement}.xml')

soup = read_xml(settlement_xml_path)

settlement_id = soup.find('rec', {'type': 'SETTLEMENT'}).findAll('i', recursive=False)[1].string

cai_settlement_file_name = found_in_all_files(os.path.join(startpos_esf_path, 'cai_settlements'), f'>{settlement_id}<', warn=False, return_first_name=True)

cai_settlement_xml_path = os.path.join(startpos_esf_path, 'cai_settlements', cai_settlement_file_name)

soup = read_xml(cai_settlement_xml_path)

soup.find('rec', {'type': 'CAI_WORLD_SETTLEMENTS'}).find('rec', {'type': 'CAI_SETTLEMENT'}).find('u4_ary').string = \
new_building_slot_ai_id + ' ' + soup.find('rec', {'type': 'CAI_WORLD_SETTLEMENTS'}).find('rec', {'type': 'CAI_SETTLEMENT'}).find('u4_ary').string

write_xml(cai_settlement_xml_path, soup)




# CHANGING regions-1

regions1_xml_path = os.path.join(regions_esf_path, 'regions-1', f'{region}.xml')

soup = read_xml(regions1_xml_path)

regions1_slot_array = soup.find('rec', {'type': 'regions'}) \
    .find('ary', {'type': 'slot_descriptions'})

regions1_slots = [i for i in regions1_slot_array.findAll('xml_include') if 'slot/settlement' in i.get('path')]
n_slots = len(regions1_slots)

# Adding new xml_include to REGION_SLOT_ARRAY

regions1_slot_array.insert(n_slots * 2, '\n   ')
regions1_slot_array.insert(n_slots * 2 + 1, soup.new_tag('xml_include', attrs={'path': f'slot/settlement-{region}-{settlement}-{new_slot}.xml'}))

write_xml(regions1_xml_path, soup)




# ADDING NEW map regions slot

template_xml_path = os.path.join(regions_esf_path, *regions1_slots[0].get('path').split('/'))

new_regions1_slot_xml_path = os.path.join(*template_xml_path.split('/')[:-1], f'settlement-{region}-{settlement}-{new_slot}.xml')

shutil.copy(template_xml_path, new_regions1_slot_xml_path)

soup = read_xml(new_regions1_slot_xml_path)

# Changing Building Slot Name
soup.find('rec', {'type': 'slot_descriptions'}).find('s', recursive=False).string = \
':'.join(soup.find('rec', {'type': 'slot_descriptions'}).find('s', recursive=False).string.split(':')[:-1] + [new_slot])
soup.find('rec', {'type': 'slot_descriptions'}).findAll('s', recursive=False)[1].string = new_slot

write_xml(new_regions1_slot_xml_path, soup)




# DONE

print(f'{region} + {new_slot}, n_slots: {n_slots} -> {n_slots + 1}, {new_building_slot_id}: template_building_slot_id -> new_building_slot_id, new_building_slot_ai_id: {template_building_slot_ai_id} -> {new_building_slot_ai_id}')
