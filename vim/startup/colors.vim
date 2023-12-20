"vim colors

syntax enable
set background=dark

if has('gui_running')
    silent! colorscheme desert
else
    " Delete pipe characters for vertical split borders; note that the trailing
    " space is intentional!
    set fillchars+=vert:\ 

    " Other cosmetic settings
    let g:gruvbox_vert_split='bg3'
    let g:gruvbox_number_column='bg1'
    let g:gruvbox_invert_selection='0'
    let g:gruvbox_hls_cursor='purple'

    silent! colorscheme gruvbox
endif
