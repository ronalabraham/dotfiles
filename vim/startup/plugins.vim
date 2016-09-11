"vim plugins

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
