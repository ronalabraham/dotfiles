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
            "bc"  # used by `tmux/conf/source_by_version.sh`
            "cmake"
            "git-all"
            "tmux"
            "tree"
            "vim"
            "xdg-utils"  # `tmux-open` plugin appears to use `xdg-open`
        )
        if command -v yum &> /dev/null; then
            install_cmd=("yum" "install" "-y")
            packages+=(
                "cmake"
                "git-all"
                "ShellCheck"
            )
        else
            install_cmd=("apt-get" "install" "-y")
            packages+=(
                "bat" # enhanced cat
                "build-essential"
                "python3-dev"
                "python3-pip"
                "shellcheck"
            )
        fi
        install_cmd+=( "${packages[@]}" )

        # check if sudo is needed
        if [ "$(id -u)" == "0" ]; then
            "${install_cmd[@]}"
        else
            sudo "${install_cmd[@]}"
        fi
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
