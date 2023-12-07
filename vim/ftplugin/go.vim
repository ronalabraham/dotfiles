" use `golines` as the Go formatter, if available
if executable('golines')
    let g:go_fmt_command = "golines"
    let g:go_fmt_options = {
        \ 'golines': '-m 120 --shorten-comments',
        \ }
endif

" local customization in ~/.vimrc_local
let $GOLOCALFILE=expand("~/.vim_local/ftplugin/go.vim")
if filereadable($GOLOCALFILE)
    source $GOLOCALFILE
endif
