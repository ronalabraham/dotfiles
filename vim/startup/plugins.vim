"vim plugins

let g:platform = GetPlatform()

call plug#begin('~/.vim/bundle')

"vim-airline for pretty status/tab lines
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1        "enable buffer list
let g:airline#extensions#tabline#fnamemod = ':t'    "show just the filename
let g:airline_theme='gruvbox'

"Enable powerline fonts in airline, per:
"  https://github.com/vim-airline/vim-airline#integrating-with-powerline-fonts
"
"You may want to disable this if your terminal emulator does not have not
"Powerline fonts installed. iTerm2 has built-in support for this:
"  iTerm2 > Preferences > Profiles > Text > "Use built-in Powerline glyphs"
let g:airline_powerline_fonts = 1

"vim-oscyank allows copying text through SSH with OSC52
Plug 'ojroques/vim-oscyank', {'branch': 'main'}

"vim-fugitive for git support in vim
Plug 'tpope/vim-fugitive'

"vim-fontdetect helps detect which fonts are available in vim
Plug 'drmikehenry/vim-fontdetect', {'branch': 'main'}

"vim-scala for scala syntax highlighting and more
Plug 'derekwyatt/vim-scala'

"plugins for colorschemes
Plug 'morhetz/gruvbox'

"vim-easymotion to move around quickly
Plug 'easymotion/vim-easymotion'

"vim tag browser
Plug 'majutsushi/tagbar'

"ultisnippets for fast snippets
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-j>"        " Ctrl+j triggers UltiSnips expansion
let g:UltiSnipsJumpForwardTrigger="<c-f>"   " Ctrl+f jumps to next snippet
let g:UltiSnipsJumpBackwardTrigger="<c-b>"  " Ctrl+b jumps to previous snippet
let g:UltiSnipsEditSplit="vertical"         " :UltiSnipsEdit splits window vertically

"nerdtree to browse files
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let g:nerdtree_tabs_open_on_gui_startup = 0
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '\.git$', '\.tsk$', '\.o$', '\.swp$']
let NERDTreeDirArrows=0
let NERDTreeShowBookmarks=1

"linux-specific plugins
if (g:platform != "AIX")
"YouCompleteMe, a fast, as-you-type code completion engine for Vim
    Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_autoclose_preview_window_after_completion = 1
endif

"ale for linting and formatting
Plug 'w0rp/ale'
let g:airline#extensions#ale#enabled = 1                        "I use airline, so why not?
let g:ale_echo_msg_error_str = 'ERROR'                          "Bloomberg ball-style
let g:ale_echo_msg_warning_str = 'WARN '                        "Bloomberg ball-style
let g:ale_echo_msg_format = '[%linter%] %severity% %code: %%s'  "nice error message format
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines',
    \       'trim_whitespace']
    \}                                     "default fixers
let g:ale_lint_on_text_changed = 'normal'  "run if text changed in normal mode (e.g. pasting)
let g:ale_lint_on_enter = 1                "run when opening a file
let g:ale_lint_on_insert_leave = 1         "run when leaving insert mode
let g:ale_lint_on_save = 1                 "run when saving a file
let g:ale_sign_column_always = 1           "always show the gutter
let g:ale_sign_error = '!>'                "looks better
let g:ale_sign_warning = '->'              "looks better
let g:ale_virtualtext_cursor = 'disabled'  "disable virtual text

"vim-tmux-navigator to navigate between tmux and vim splits cleanly
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1          "use custom mappings (see mappings.vim)
let g:tmux_navigator_disable_when_zoomed = 1  "navigation keys do not unzoom zoomed pane

"fuzzy finder support in vim. Note that I installed fzf support with git:
"    https://github.com/junegunn/fzf#as-vim-plugin
Plug '~/.fzf'

"LanguageClient-neovim for LangServer support (https://langserver.org/)
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"TOML syntax highlighing (not needed for Vim 8.2.3519+)
if v:version < 803  "https://stackoverflow.com/a/11775069/5569830
    Plug 'cespare/vim-toml', { 'branch': 'main' }
endif

"vim-go for Go (golang) development
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

"plugins I want to try
"Plug 'scrooloose/syntastic'
"Plug 'benmills/vimux'
"Plug 'tpope/vim-speeddating'
