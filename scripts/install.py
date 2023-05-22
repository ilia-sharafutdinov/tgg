import json
import os
import glob
import shutil
from dotenv import load_dotenv

load_dotenv()

core_dir = os.path.dirname(os.path.dirname(__file__))
json_path = os.path.join(core_dir, 'scripts', 'install.json')

with open(json_path) as f:
    install = json.load(f)


print(f'+++install+++')

deactivate = install['deactivate']
activate = install['activate']

compiled_dir = os.path.join(core_dir, 'bin', 'compiled')
lib_dir = os.path.join(core_dir, 'lib')
install_dir = os.path.join(core_dir, os.environ['install_dir'])


print('Removing installed packs.')
for file in glob.glob(os.path.join(install_dir, 'data', 'tgg_*.pack*')):
    os.remove(file)

print('Copying compiled.')
shutil.copytree(compiled_dir, install_dir, dirs_exist_ok=True)

print('Copying lib.')
shutil.copytree(lib_dir, install_dir, dirs_exist_ok=True, ignore=shutil.ignore_patterns('README.md'))

for pack in deactivate:
    shutil.move(os.path.join(install_dir, 'data', f'{pack}.pack'), os.path.join(install_dir, 'data', f'{pack}.pack.bak'))

for pack in activate:
    shutil.move(os.path.join(install_dir, 'data', f'{pack}.pack.bak'), os.path.join(install_dir, 'data', f'{pack}.pack'))

print('Done.')
