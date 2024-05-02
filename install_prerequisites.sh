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
        packages=(
            "bat" # enhanced cat
            "bc"  # used by `tmux/conf/source_by_version.sh`
            "build-essential"
            "cmake"
            "exuberant-ctags"
            "git-all"
            "python3-dev"
            "python3-pip"
            "shellcheck"
            "tmux"
            "tree"
            "vim"
            "xdg-utils"  # `tmux-open` plugin appears to use `xdg-open`
        )
        sudo apt-get install "${packages[@]}"
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
    pylint \
    wemake-python-styleguide
