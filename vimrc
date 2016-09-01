" .vimrc
"
" Copied shamelessly from Mario Longobardi's vimrc, which can be found here:
"     https://github.com/mlongob/dotfiles/blob/master/vimrc
"

source ~/.vim/startup/mappings.vim
source ~/.vim/startup/settings.vim

" local customization in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif
