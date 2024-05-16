# dotfiles
My dotfile repository, using dotbot for bootstrapping (see https://github.com/anishathalye/dotbot).

## Required Packages
To install prerequisite packages on Ubuntu or MacOS, run:
```bash
install_prerequisites.sh
```

## Installation
```bash
git clone https://github.com/ronalabraham/dotfiles.git ~/.dotfiles && ~/.dotfiles/install
```

## Customization
You can make customizations for the following programs by editing their (untracked) configuration files on your machine:

| Program     | Local config file                |
| ----------- | -------------------------------- |
| vim         | ~/.vimrc_local                   |
|             | ~/.vim_local/ftplugin/cpp.vim    |
|             | ~/.vim_local/ftplugin/java.vim   |
|             | ~/.vim_local/ftplugin/python.vim |
| git         | ~/.gitconfig_local               |
| tmux        | ~/.tmux.conf_local               |

## Updating Submodules
This repository uses a few git submodules. To update the submodule pointer to a different commit:
1. `cd` to submodule directory.
1. `git checkout` the commit you want to point to.
1. `cd` back to repository root.
    1. `git diff` will now show the old and new commit pointers
1. `git commit` the change in the repository root.
1. `git push` the change up to `origin/main`.
