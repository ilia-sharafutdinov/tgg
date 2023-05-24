import json
import os
import shutil
import fileinput
import subprocess
from dotenv import load_dotenv

load_dotenv()

core_dir = os.path.dirname(os.path.dirname(__file__))
campaigns_json_path = os.path.join(core_dir, 'scripts', 'campaigns.json')
packs_json_path = os.path.join(core_dir, 'scripts', 'packs.json')

build_pack = os.path.join(core_dir, os.environ['build_pack'])
db_pack = os.path.join(core_dir, os.environ['db_pack'])
tsv2loc = os.path.join(core_dir, os.environ['tsv2loc'])
gfpack = os.path.join(core_dir, os.environ['gfpack'])

modfolding_dir = os.path.join(core_dir, 'src', 'modfolding')

with open(campaigns_json_path) as f:
    campaigns = json.load(f)

with open(packs_json_path) as f:
    packs = json.load(f)


for pack, specs in packs.items():
    print(f'+++{pack}+++')

    active = specs['active']
    parents = None if 'parents' not in specs else specs['parents']

    compilated_pack_dir = os.path.join(core_dir, 'bin', 'compilated', 'data', 'packs', pack)
    compiled_pack_dir = os.path.join(core_dir, 'bin', 'compiled', 'data')
    compiled_pack_path = os.path.join(compiled_pack_dir, f'{pack}.pack{"" if active else ".bak"}')
    pack_dir = os.path.join(core_dir, 'packs', pack)

    if os.path.isdir(compilated_pack_dir):
        shutil.rmtree(compilated_pack_dir)

    if parents:
        print('Copying parents.')
        for parent in parents:
            shutil.copytree(os.path.join(core_dir, 'packs', parent), compilated_pack_dir, dirs_exist_ok=True)

    if pack in campaigns:
        print('Copying modfolding src.')
        shutil.copytree(modfolding_dir, compilated_pack_dir, dirs_exist_ok=True)
        os.rename(os.path.join(compilated_pack_dir, 'rigidmodels', 'campaignroads', 'main'), os.path.join(compilated_pack_dir, 'rigidmodels', 'campaignroads', pack))

        with fileinput.FileInput(os.path.join(compilated_pack_dir, 'custom_campaign.lua'), inplace=True) as file:
            for line in file:
                print(line.replace('main', pack), end='')


    if os.path.isdir(pack_dir):
        print('Compilating pack.')
        shutil.copytree(pack_dir, compilated_pack_dir, dirs_exist_ok=True, ignore=shutil.ignore_patterns('README.md', 'text'))

        db_dir = os.path.join(compilated_pack_dir, 'db')
        if os.path.isdir(db_dir):
            print('Compiling db.')
            subprocess.run([db_pack, db_dir, db_dir], check=True)
            for root, dirs, files in os.walk(db_dir):
                for file in files:
                    if file.endswith('.tsv'):
                        os.remove(os.path.join(root, file))

        text_dir = os.path.join(pack_dir, 'text')
        if os.path.isdir(text_dir):
            print('Compiling text.')
            if pack == 'tgg_base':
                # os.mkdir(os.path.join(compilated_pack_dir, 'text'))
                shutil.copytree(text_dir, os.path.join(compilated_pack_dir, 'text'), ignore=shutil.ignore_patterns('*.tsv'))
                for file in ['localisation.tsv', 'ui.tsv']:
                    subprocess.run([tsv2loc, os.path.join(text_dir, file), os.path.join(compilated_pack_dir, 'text', f'{file[:-4]}.loc')], check=True)
            else:
                shutil.copytree(text_dir, os.path.join(compilated_pack_dir, 'text'))
                for file in ['localisation.tsv', 'ui.tsv']:
                    if os.path.isfile(os.path.join(text_dir, file)):
                        source = open(os.path.join(core_dir, 'packs', 'tgg_base', 'text', file), 'r')
                        destination = open(os.path.join(compilated_pack_dir, 'text', file), 'a')
                        destination.write(source.read())
                        source.close()
                        destination.close()
                        subprocess.run([tsv2loc, os.path.join(compilated_pack_dir, 'text', file), os.path.join(compilated_pack_dir, 'text', f'{file[:-4]}.loc')], check=True)
                        os.remove(os.path.join(compilated_pack_dir, 'text', file))

        groupformations_path = os.path.join(compilated_pack_dir, 'groupformations.txt')
        if os.path.isfile(groupformations_path):
            print('Compiling groupformations.')
            subprocess.run([gfpack], check=True, cwd=compilated_pack_dir)
            os.remove(groupformations_path)


    print(f'Building pack.')
    os.makedirs(compiled_pack_dir, exist_ok=True)
    subprocess.run([build_pack, compiled_pack_path, 'movies', compilated_pack_dir], check=True)


print('+++final+++')

print('Done.')
