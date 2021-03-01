"vim colors

"set up for solarized colorscheme
let g:solarized_termcolors=256
let g:solarized_termtrans=1
syntax enable
set background=dark

if has('gui_running')
    silent! colorscheme desert
else
    silent! colorscheme solarized
endif
