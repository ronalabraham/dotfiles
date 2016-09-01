" vim mappings

"jk in insert mode put you back in normal mode
:inoremap jk <esc>

"\s sources $MYVIMRC
"\v opens $MYVIMRC for editing
:nnoremap <leader>s :source $MYVIMRC<cr>
:nnoremap <leader>v :e $MYVIMRC<cr>
