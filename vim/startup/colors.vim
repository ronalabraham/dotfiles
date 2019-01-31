"vim colors

"set up for solarized colorscheme
let g:solarized_termcolors=256
syntax enable
set background=dark

if has('gui_running')
    colorscheme desert
else
    colorscheme solarized
endif
