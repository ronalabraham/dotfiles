"vim plugins

let g:platform = GetPlatform()

"START Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"vim-airline for pretty status/tab lines
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1        "enable buffer list
let g:airline#extensions#tabline#fnamemod = ':t'    "show just the filename

"vim-fontdetect helps detect which fonts are available in vim
Plugin 'drmikehenry/vim-fontdetect'

"vim-scala for scala syntax highlighting and more
Plugin 'derekwyatt/vim-scala'

"vim-colors-solarized plugin for solarized colorscheme
Plugin 'altercation/vim-colors-solarized'

"vim-easymotion to move around quickly
Plugin 'easymotion/vim-easymotion'

"vim git command-line wrapper (and more)
Plugin 'tpope/vim-fugitive'

"vim tag browser
Plugin 'majutsushi/tagbar'

"ultisnippets for fast editing
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<c-j>"        " Ctrl+j triggers UltiSnips expansion
let g:UltiSnipsJumpForwardTrigger="<c-f>"   " Ctrl+f jumps to next snippet
let g:UltiSnipsJumpBackwardTrigger="<c-b>"  " Ctrl+b jumps to previous snippet
let g:UltiSnipsEditSplit="vertical"         " :UltiSnipsEdit splits window vertically

"nerdtree to browse files
Plugin 'scrooloose/nerdtree'
let g:nerdtree_tabs_open_on_gui_startup = 0
let NERDTreeIgnore = ['\.pyc$', '\.tsk$', '\.o$']
let NERDTreeDirArrows=0
let NERDTreeShowBookmarks=1

"linux-specific plugins
if g:platform != "AIX"
"YouCompleteMe, a fast, as-you-type code completion engine for Vim
    Plugin 'Valloric/YouCompleteMe'
    let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_autoclose_preview_window_after_completion = 1
endif

"black for Python code formatting
Plugin 'ambv/black'
let g:black_linelength=79
let g:black_virtualenv="~/.vim_black"

"ale for linting and formatting
Plugin 'w0rp/ale'
let g:ale_sign_column_always = 1                                "always show the gutter
let g:ale_sign_error = '!>'                                     "looks better
let g:ale_sign_warning = '->'                                   "looks better
let g:airline#extensions#ale#enabled = 1                        "I use airline, so why not?
let g:ale_echo_msg_error_str = 'ERROR'                          "Bloomberg ball-style
let g:ale_echo_msg_warning_str = 'WARN '                        "Bloomberg ball-style
let g:ale_echo_msg_format = '[%linter%] %severity% %code: %%s'  "nice error message format

let g:ale_linters = {}
let g:ale_linters.python = [
            \'pycodestyle',
            \'flake8',
            \'mypy',
            \'pylint']                                          "python linters I want to run
let g:ale_python_pylint_executable = 'pylint3.6'                "hopefully temporary

let g:ale_fixers = {}
let g:ale_fixers.python = ['isort', 'black']                    "python fixers I care about
let g:ale_python_isort_options =
            \"--line-width=79 --multi_line=3"                   "79 characters, vertical hanging indents
let g:ale_python_black_options =
            \"--line-length 79"                                 "79 characters

"all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"END Vundle setup

"plugins I want to try
"Plugin 'scrooloose/syntastic'
"Plugin 'benmills/vimux'
"Plugin 'tpope/vim-speeddating'
