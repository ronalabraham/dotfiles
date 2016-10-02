"vim mappings

"jk in insert mode put you back in normal mode
inoremap jk <esc>

"Ctrl+j maps to Page Down in normal mode
"Ctrl+k maps to Page Up in normal mode
:nnoremap <C-j> <C-d>
:nnoremap <C-k> <C-u>

"Ctrl+Tab moves to next buffer
"Ctrl+Shift+Tab moves to next buffer
"from vim.wikia.com/wiki/Cycle_through_buffers_including_hidden_buffers
nnoremap <C-Tab> :bnext<CR>
nnoremap <C-S-Tab> :bprevious<CR>
nnoremap <A-n> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <A-p> :bprevious<CR>:redraw<CR>:ls<CR>

"Ctrl+z maps to undo
"Ctrl+y maps to redo
"Ctrl+v pastes from system buffer
"Ctrl+c closes the current buffer; from:
"stackoverflow.com/questions/4465095/vim-delete-buffer-without-losing-the-split-window
"Ctrl+s saves the current buffer
nnoremap <C-z> u
inoremap <C-z> <C-\><C-o>u
nnoremap <C-y> <C-R>
inoremap <C-y> <C-o><C-R>
nnoremap <C-v> "*p
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>
nnoremap <C-c> :bp\|bd #<CR>
noremap <C-s> :w<CR>
inoremap <C-S> <Esc>:w<CR>

"Ctrl+backspace deletes previous word
"from vim.wikia.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
inoremap <C-w> <C-\><C-o>dB
inoremap <C-BS> <C-\><C-o>db

"Ctrl+w,_ splits window horizontally
"Ctrl+w,| splits window vertically
noremap <C-w>_ <C-w>s
noremap <C-w><Bar> <C-w>v

"f*ck Ex mode (see www.bestofvim.com/tip/leave-ex-mode-good/)
nnoremap Q <nop>

"double-click in normal mode changes to insert/append mode
"double-click in insert mode changes to normal mode
"Shift+left-click in normal mode searches for the current word, from:
"stackoverflow.com/questions/6876850/how-to-highlight-all-occurrences-of-a-word-in-vim-on-double-clicking
"see also:
"stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping
nnoremap <2-LeftMouse> :call InsertOrAppendMode()<cr>
inoremap <2-LeftMouse> <Esc>
nnoremap <silent> <S-LeftMouse> <LeftMouse>:let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>:set hls<cr>

"Tab in visual mode indents (gv reselects the same visual area)
"Shift+Tab in visual mode unindents
"Enter in normal mode adds a new line
vnoremap <Tab> >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv
nnoremap <silent> <CR> :call InsertOrAppendMode()<CR><CR><Esc>

"Ctrl+w,_ splits window horizontally
"Ctrl+w,| splits window vertically
noremap <C-w>_ <C-w>s
noremap <C-w><Bar> <C-w>v

"Setup for vim-easymotion
"------------------------
", is the easymotion prefix
",w triggers bidirectional (beginning of) word jumping
",e triggers bidirectional (end of) word jumping
",l triggers bidirectional line jumping
",/ triggers bidirectional last-search jumping
map , <Plug>(easymotion-prefix)
map ,w <Plug>(easymotion-bd-w)
map ,e <Plug>(easymotion-bd-e)
map ,l <Plug>(easymotion-bd-jk)
map ,/ <Plug>(easymotion-bd-n)

"Setup for NERDTree
"------------------
let g:nerdtree_tabs_open_on_gui_startup = 0
let NERDTreeIgnore = ['\.pyc$', '\.tsk$', '\.o$']
let NERDTreeDirArrows=0
let NERDTreeShowBookmarks=1

"Leader key mappings
"-------------------
"\s sources $MYVIMRC
nnoremap <leader>s :source $MYVIMRC<cr>

"\v opens $MYVIMRC for editing
nnoremap <leader>v :e $MYVIMRC<cr>

"\+Tab toggles tab size
nnoremap <leader><tab> :call TabToggle()<CR>

"\+cc toggles the colorcolumn
nnoremap <leader>cc :call ColorColumnToggle()<CR>

"\+ws toggles showing unprintable characters; see also: vim.wikia.com/wiki/Managing_set_options
nnoremap <leader>ws :call UnprintableToggle()<CR>

"\+ts removes trailing whitespaces
nnoremap <leader>ts :call TrimTrailingWhitespaces()<CR>

"\+aw toggles auto-wrapping while editting
nnoremap <leader>aw :call EditAutoWrapToggle()<CR>

"\+nt toggles nerd tree browser
nnoremap <leader>nt :NERDTreeToggle<CR>

"gvim-specific settings
if has('gui_running')
    "F12 increments font size
    "Shift+F12 decrements font size
    nmap <F12> : call FontSizePlus()<CR>
    nmap <S-F12> : call FontSizeMinus()<CR>
endif
