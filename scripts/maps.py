import json
import os
import shutil
import glob
import subprocess
from dotenv import load_dotenv

load_dotenv()

core_dir = os.path.dirname(os.path.dirname(__file__))
json_path = os.path.join(core_dir, 'scripts', 'maps.json')

xml2esf_path = os.path.join(core_dir, os.environ['xml2esf'])

with open(json_path) as f:
    maps = json.load(f)

for map_name, specs in maps.items():
    print(f'+++{map_name}+++')

    parent = specs['parent']
    mods = specs['mods']

    map_dir = os.path.join(core_dir, 'bin', 'compilated', 'data', 'maps', map_name)
    compiled_esf_dir = os.path.join(core_dir, 'bin', 'compiled', 'data', 'campaign_maps', map_name)
    parent_dir = os.path.join(core_dir, 'src', 'maps', parent)
    modfolding_dir = os.path.join(core_dir, 'src', 'modfolding')


    print(f'Copying {parent}...')
    if os.path.isdir(map_dir):
        shutil.rmtree(map_dir)
    shutil.copytree(parent_dir, map_dir)

    for mod in mods:
        print(f'Applying {mod}.')
        mod_dir = os.path.join(core_dir, 'maps', parent, mod)
        shutil.copytree(mod_dir, map_dir, dirs_exist_ok=True)

    if os.path.isdir(compiled_esf_dir):
        shutil.rmtree(compiled_esf_dir)
    os.makedirs(compiled_esf_dir)
    for esf in ['pathfinding', 'poi', 'regions', 'sea_grids', 'trade_routes']:
        print(f'Compiling {esf}.esf...')
        process = subprocess.Popen([xml2esf_path, os.path.join(map_dir, esf), os.path.join(compiled_esf_dir, f'{esf}.esf')])
        process.wait()
        assert process.returncode == 0

    print('Copying tga.')
    for file in glob.glob(f"{os.path.join(map_dir, '*.tga')}"):
        shutil.copy(file, compiled_esf_dir)

    print('Done.')
