import os
import shutil
from dotenv import load_dotenv

load_dotenv()

core_dir = os.path.dirname(os.path.dirname(__file__))
dist_dir = os.path.join(core_dir, 'dist')
temp_dir = os.path.join(core_dir, 'bin', 'temp')
version = os.environ['version']
light_path = os.path.join(dist_dir, f'foothold_in_india_{version}_light.zip')
complete_path = os.path.join(dist_dir, f'foothold_in_india_{version}_complete.zip')


print(f'+++zip+++')

print('Zipping light...')
if os.path.isdir(temp_dir):
    shutil.rmtree(temp_dir)
shutil.copytree(dist_dir, temp_dir, ignore=shutil.ignore_patterns('README.md', 'sounds_sfx.pack', 'tgg_media_*', '*.zip'))
if os.path.isfile(light_path):
    os.remove(light_path)
shutil.make_archive(light_path[:-4], 'zip', root_dir=temp_dir)

print('Zipping complete...')
if os.path.isdir(temp_dir):
    shutil.rmtree(temp_dir)
shutil.copytree(dist_dir, temp_dir, ignore=shutil.ignore_patterns('README.md', '*.zip'))
if os.path.isfile(complete_path):
    os.remove(complete_path)
shutil.make_archive(complete_path[:-4], 'zip', root_dir=temp_dir)

print('Done.')
