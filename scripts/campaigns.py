import json
import os
import shutil
import fileinput
import subprocess
from dotenv import load_dotenv

load_dotenv()

core_dir = os.path.dirname(os.path.dirname(__file__))
json_path = os.path.join(core_dir, 'scripts', 'campaigns.json')

xml2esf_path = os.path.join(core_dir, os.environ['xml2esf'])
build_pack_path = os.path.join(core_dir, os.environ['build_pack'])

with open(json_path) as f:
    campaigns = json.load(f)

processes = []
for campaign, specs in campaigns.items():
    print(f'+++{campaign}+++')

    parent = specs['parent']
    map_name = specs['map']
    preopen_map = map_name if 'preopen_map' not in specs else specs['preopen_map']
    mods = specs['mods']

    campaign_dir = os.path.join(core_dir, 'bin', 'compilated', 'data', 'campaigns', campaign)
    compiled_esf_dir = os.path.join(core_dir, 'bin', 'compiled', 'data', 'campaigns', campaign)
    startpos_dir = os.path.join(campaign_dir, 'startpos')
    parent_dir = os.path.join(core_dir, 'src', 'campaigns', parent)
    compiled_esf_path = os.path.join(compiled_esf_dir, 'startpos.esf')


    print(f'Copying {parent}...')
    if os.path.isdir(campaign_dir):
        shutil.rmtree(campaign_dir)
    shutil.copytree(parent_dir, campaign_dir)

    for mod in mods:
        print(f'Applying {mod}.')
        mod_dir = os.path.join(core_dir, 'campaigns', parent, mod)
        shutil.copytree(mod_dir, campaign_dir, dirs_exist_ok=True)

    print('Applying correct campaign and map names.')
    for path in [['preopen_map_info', f'info-{parent}.xml'], ['campaign_env', 'campaign_model.xml'], ['campaign_env', f'campaign_setup-{parent}.xml']]:
        file_path = os.path.join(startpos_dir, *path)
        with fileinput.FileInput(file_path, inplace=True) as file:
            for line in file:
                if path[0] == 'preopen_map_info':
                    print(line.replace(f'<s>main</s>', f'<s>{campaign}</s>')
                          .replace('<s>global_map</s>', f'<s>{preopen_map}</s>'), end='')
                else:
                    print(line.replace(f'<s>main</s>', f'<s>{campaign}</s>')
                          .replace('<s>global_map</s>', f'<s>{map_name}</s>')
                          .replace('<s>campaign_maps/global_map</s>', f'<s>campaign_maps/{map_name}</s>'), end='')

    print('Compiling esf.')
    if os.path.isdir(compiled_esf_dir):
        shutil.rmtree(compiled_esf_dir)
    os.makedirs(compiled_esf_dir)
    process = subprocess.Popen([xml2esf_path, startpos_dir, compiled_esf_path])
    processes.append(process)

    print('Copying scripting.lua.')
    shutil.copy2(os.path.join(campaign_dir, 'scripting.lua'), os.path.join(compiled_esf_dir, 'scripting.lua'))


print('+++final+++')

print('Waiting for jobs to finish...')
returncodes = []
for process in processes:
    process.wait()
    returncodes.append(process.returncode)

assert all([returncode == 0 for returncode in returncodes])

print('Done.')
