" local customization in ~/.vimrc_local
let $PYTHONLOCALFILE=expand("~/.vim_local/ftplugin/python.vim")
if filereadable($PYTHONLOCALFILE)
    source $PYTHONLOCALFILE
endif
