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
You may need to set `$JAVA_HOME` (i.e. `JAVA_HOME=<path-to-a-jdk8> ~/.dotfiles/install`) if `$JAVA_HOME` is undefined or points to a newer Java version, because eclipse.jdt.ls (Java LangServer) only builds with Java 8.

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
