#!/bin/bash
set -e

export MINICONDA_HOME=${TRAVIS_HOME}/miniconda3-${MINICONDA_VERSION}
export PATH=${TRAVIS_HOME}/miniconda3-${MINICONDA_VERSION}/bin:$PATH
echo "Install dependencies for ${TRAVIS_OS_NAME}"

##########################
# INSTALL MINICONDA
if [ -d "${MINICONDA_HOME}/bin" ]
then
    echo "Detect that miniconda3 has been installed before (${MINICONDA_HOME}/bin exists). Skip the installation"
else
    echo "${MINICONDA_HOME}/bin not found. Install it!"
    rm -rf ${MINICONDA_HOME}

    if [ "${TRAVIS_OS_NAME}" = "linux" ]
    then
        wget https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -O /tmp/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh
        mkdir ${TRAVIS_HOME}/.conda
        sh /tmp/Miniconda3-${MINICONDA_VERSION}-Linux-x86_64.sh -b -p ${MINICONDA_HOME}
        conda install -y gxx_linux-64
    fi

    if [ "${TRAVIS_OS_NAME}" = "osx" ]
    then
        wget https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA_VERSION}-MacOSX-x86_64.sh -O /tmp/Miniconda3-${MINICONDA_VERSION}-MacOSX-x86_64.sh
        mkdir ${TRAVIS_HOME}/.conda
        sh /tmp/Miniconda3-${MINICONDA_VERSION}-MacOSX-x86_64.sh -b -p ${MINICONDA_HOME}
    fi

    if [ "${TRAVIS_OS_NAME}" = "windows" ]
    then
        choco install miniconda3 --version ${MINICONDA_VERSION} -y
        export PATH=/c/tools/miniconda3:$PATH
        # wget https://repo.anaconda.com/miniconda/Miniconda3-${MINICONDA_VERSION}-Windows-x86_64.exe -O /tmp/Miniconda3-${MINICONDA_VERSION}-Windows-x86_64.exe
        # mkdir ${TRAVIS_HOME}/.conda
        #   /tmp/Miniconda3-${MINICONDA_VERSION}-Windows-x86_64.exe -b -p ${MINICONDA_HOME}
    fi
fi

##########################
# INSTALL RUST

# export PATH=${TRAVIS_HOME}/.cargo/bin:$PATH

# if [ -d "${TRAVIS_HOME}/.cargo/bin" ]
# then
#     echo "Detect that rust has been installed before (${TRAVIS_HOME}/.cargo/bin exists). Skip the installation"
# else
#     curl -sSf https://build.travis-ci.org/files/rustup-init.sh | sh -s -- --default-toolchain=${RUST_VERSION} -y
# fi

# # update rust
# rustup update
# # print versions
# rustc --version
# rustup --version
# cargo --version