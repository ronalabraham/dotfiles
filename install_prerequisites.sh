#!/bin/bash

os=$(uname -s)
case $os in
    "Darwin")
        brew install \
            cmake \
            coreutils \
            cscope \
            ctags \
            git \
            gnu-sed \
            google-java-format \
            gradle \
            grep \
            hub \
            macvim \
            maven \
            node \
            openssl \
            pstree \
            python \
            python3 \
            readline \
            sqlite \
            tmux \
            tree \
            ;;
    "Linux" )
        sudo apt-get install \
            build-essential \
            cmake \
            exuberant-ctags \
            git-all \
            kompare \
            python-dev \
            python3-dev \
            python3-pip \
            scala \
            tmux \
            tree \
            vim
            ;;
esac
python3 -m pip install \
    black \
    cmake_format \
    flake8 \
    gitpython \
    isort \
    mypy \
    pydocstyle \
    pylint
