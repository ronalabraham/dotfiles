" vim settings

syntax on

" miscellaneous
set nocompatible

" tabs and indents
set autoindent    "copy indent from current line when starting new line
set cindent       "enable automatic C program indenting
set expandtab     "tabs expanded to spaces in Insert mode
set shiftwidth=4  "number of spaces for each autoindent step
set shiftround    "round indent to multiple of shiftwidth
set smartindent   "do smart autoindenting when starting a new line
set smarttab      "tab in fromt of line insert 'shiftwidth' spaces
set softtabstop=4 "number of spaces that tab counts for while performing edits
set tabstop=4     "number of spaces that tab counts for

" buffers
set hidden        "allow hiding of buffers without saving changes

" editing text
set backspace=indent,eol,start

"displaying text
set nowrap
set number
