#!/usr/bin/env python2.7
# coding: utf-8

"""_
# Mdv installation

## Usage

    [sudo] ./setup.py install

----
"""

import os
from setuptools import setup, find_packages

version = '1.7.4'

with open(os.path.join(os.path.dirname(__file__), 'README.md')) as fd:
    md = fd.read()

# images hack for pypi:
gh = 'https://raw.githubusercontent.com/axiros/terminal_markdown_viewer/master'
md = md.replace('src="./', 'src="%s/' % gh)

setup(
    name='mdv',
    version=version,
    packages=find_packages(),
    author='Axiros GmbH',
    author_email='gk@axiros.com',
    description='Terminal Markdown Viewer',
    install_requires=['pygments', 'markdown'],
    extras_require={'yaml': 'pyyaml'},
    long_description=md,
    long_description_content_type='text/markdown',
    include_package_data=True,
    url='http://github.com/axiros/terminal_markdown_viewer',
    download_url='http://github.com/axiros/terminal_markdown_viewer/tarball/',
    keywords=['markdown', 'markup', 'terminal', 'hilighting', 'syntax', 'source code',],
    tests_require=['pytest'],
    classifiers=[
        'Programming Language :: Python',
        'Natural Language :: English',
        'Operating System :: POSIX',
        'Topic :: Text Processing :: Markup',
        'License :: OSI Approved :: BSD License',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
    ],
    entry_points={'console_scripts': ['mdv = mdv:run']},
)
