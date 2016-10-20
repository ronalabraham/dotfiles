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
