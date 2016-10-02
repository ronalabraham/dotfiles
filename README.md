# dotfiles
My dotfile repository, using dotbot for bootstrapping (see https://github.com/anishathalye/dotbot).

## Required Packages
To install prerequisite packages on Ubuntu, run:
```bash
install_packages.sh
```

## Installation
Run the following in a directory of your choosing (preferably somewhere in home):
```bash
git clone https://github.com/ronalabraham/dotfiles.git && cd dotfiles && ./install
```
## Customization
You can make customizations for the following programs by editing their (untracked) configuration files on your machine:

| Program     | Local config file  |
| ----------- | ------------------ |
| vim         | ~/.vimrc_local     |
| git         | ~/.gitconfig_local |
| tmux        | ~/.tmux.conf_local |
