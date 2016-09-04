"vim settings

syntax on

"miscellaneous
set nocompatible

"tabs and indents
set autoindent                                  "copy indent from current line when starting new line
set cindent                                     "enable automatic C program indenting
set expandtab                                   "tabs expanded to spaces in Insert mode
set shiftwidth=4                                "number of spaces for each autoindent step
set shiftround                                  "round indent to multiple of shiftwidth
set smartindent                                 "do smart autoindenting when starting a new line
set smarttab                                    "tab in fromt of line insert 'shiftwidth' spaces
set softtabstop=4                               "number of spaces that tab counts for while performing edits
set tabstop=4                                   "number of spaces that tab counts for

"buffers
set hidden                                      "allow hiding of buffers without saving changes

"editing text
set backspace=indent,eol,start
if has("persistent_undo")                       "persist undo/redo history on disk
    set undofile
    set undodir=~/.vim/undo
endif

"searching text
set hlsearch                                    "highlight all search matches
set incsearch                                   "enable incremental search
set smartcase                                   "override ignorecase option if uppercase

"displaying text
set nowrap
set number

"gvim-specific settings
if has('gui_running')
    set guioptions+=b                           "show horizontal scrollbar
    set list                                    "show unprintable characters
    set listchars=trail:_                       "show trailing whitespace with a '_'
    let &colorcolumn=join(range(80,999),",")    "highlight column 80 onwards
    let &guifont = fontdetect#firstFontFamily([
                 \ "Ubuntu Mono",
                 \ "Deja Vu Sans Mono",
                 \ "Monospace"]) . " 10"        "select font and size
endif
