" absolute path to the location of the eclipse.jdt.ls folder
let g:ale_java_eclipselsp_path='$HOME/.eclipse.jdt.ls'

" disable LanguageClient diagnostics because ALE (eclipselsp) is used for that
let g:LanguageClient_diagnosticsEnable=0

set tabstop=2     "number of spaces that tab counts for
set softtabstop=2 "number of spaces that tab counts for while performing edits
set shiftwidth=2  "number of spaces for each autoindent step

" local customization in ~/.vimrc_local
let $JAVALOCALFILE=expand("~/.vim_local/ftplugin/java.vim")
if filereadable($JAVALOCALFILE)
    source $JAVALOCALFILE
endif
