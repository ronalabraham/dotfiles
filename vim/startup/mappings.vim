"vim mappings

"jk in insert mode put you back in normal mode
inoremap jk <esc>

"\s sources $MYVIMRC
"\v opens $MYVIMRC for editing
nnoremap <leader>s :source $MYVIMRC<cr>
nnoremap <leader>v :e $MYVIMRC<cr>

"gvim-specific settings
if has('gui_running')
    "F12 increments font size
    "Shift+F12 decrements font size
    nmap <F12> : call FontSizePlus()<CR>
    nmap <S-F12> : call FontSizeMinus()<CR>
endif
