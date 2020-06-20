" local customization in ~/.vimrc_local
let $XSDLOCALFILE=expand("~/.vim_local/ftplugin/xsd.vim")
if filereadable($XSDLOCALFILE)
    source $XSDLOCALFILE
endif
