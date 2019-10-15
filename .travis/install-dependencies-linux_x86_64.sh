#!/bin/bash
set -e

export MINICONDA_HOME=${TRAVIS_HOME}/miniconda3-${MINICONDA_VERSION}
export PATH=${TRAVIS_HOME}/miniconda3-${MINICONDA_VERSION}/bin:$PATH

##########################
# INSTALL MINICONDA
if [ -d "${MINICONDA_HOME}" ]
then
    echo "Detect that ${MINICONDA_HOME} has been installed before. Skip the installation"
else
    echo "${MINICONDA_HOME} not found. Install it!"
    wget https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -O /tmp/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh
    mkdir ${TRAVIS_HOME}/.conda && sh /tmp/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -b -p ${MINICONDA_HOME}
    conda install -y gxx_linux-64
fi

##########################
# RUST is already installed, so we skipped