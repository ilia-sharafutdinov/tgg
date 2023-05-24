import os
import subprocess

core_dir = os.path.dirname(os.path.dirname(__file__))


print(f'+++make_pdf+++')

print('Making pdf.')

subprocess.run(['pandoc', '-H', '.tex', '-f', 'markdown', 'README.md', '-o', 'dist/README.pdf'], check=True, cwd=core_dir)

print('Done.')
