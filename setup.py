import os
import shutil
import sys

from setuptools import setup, find_packages

exec(open("dummy_lib/version.py").read())

setup(name="dummy_lib",
      version=__version__,
      packages=find_packages(),
      author="Binh Vu",
      author_email="binh@toan2.com",
      license="MIT",
      install_requires=[],
      package_data={})