#!/bin/bash

os=`uname -s`
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
            scala \
            tmux \
            tree \
            vim
            ;;
esac