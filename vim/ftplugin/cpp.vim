" local customization in ~/.vimrc_local
let $CPPLOCALFILE=expand("~/.vim_local/ftplugin/cpp.vim")
if filereadable($CPPLOCALFILE)
    source $CPPLOCALFILE
endif
