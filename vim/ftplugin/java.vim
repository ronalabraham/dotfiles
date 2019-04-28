" local customization in ~/.vimrc_local
let $JAVALOCALFILE=expand("~/.vim_local/ftplugin/java.vim")
if filereadable($JAVALOCALFILE)
    source $JAVALOCALFILE
endif
