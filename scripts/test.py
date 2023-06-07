import os
import shutil
from dotenv import load_dotenv

load_dotenv()

core_dir = os.path.dirname(os.path.dirname(__file__))


print(f'+++test+++')

test_dir = os.path.join(core_dir, 'test')
install_dir = os.path.join(core_dir, os.environ['install_dir'])

print('Copying test.')
shutil.copytree(test_dir, install_dir, dirs_exist_ok=True, ignore=shutil.ignore_patterns('README.md'))

print('Done.')
