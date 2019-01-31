" .vimrc
"
" Copied shamelessly from Mario Longobardi's vimrc, which can be found here:
"     https://github.com/mlongob/dotfiles/blob/master/vimrc
"

source ~/.vim/startup/commands.vim
source ~/.vim/startup/functions.vim
source ~/.vim/startup/plugins.vim
source ~/.vim/startup/settings.vim
source ~/.vim/startup/colors.vim
source ~/.vim/startup/mappings.vim

" local customization in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
