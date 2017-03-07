"vim settings

syntax on

"miscellaneous
set nocompatible

"tabs and indents
set autoindent                                  "copy indent from current line when starting new line
set cindent                                     "enable automatic C program indenting
set expandtab                                   "tabs expanded to spaces in Insert mode
set tabstop=4                                   "number of spaces that tab counts for
set softtabstop=4                               "number of spaces that tab counts for while performing edits
set shiftwidth=4                                "number of spaces for each autoindent step
set shiftround                                  "round indent to multiple of shiftwidth
set smartindent                                 "do smart autoindenting when starting a new line
set smarttab                                    "tab in fromt of line insert 'shiftwidth' spaces
set cinwords+=case                              "start an extra indent for case statements
set cinoptions=:1s,=1s,l1,g0.5s,h0.5s,t0,i0,(0
"              |   |   |  |     |     |  |  +-- indent from unclosed parens
"              |   |   |  |     |     |  +----- C++ base class decls and initializations
"              |   |   |  |     |     +-------- indent function return type at margin
"              |   |   |  |     +-------------- places statements after C++ scope decls
"              |   |   |  +-------------------- place C++ scope declarations
"              |   |   +----------------------- align with case label instead of statement
"              |   +--------------------------- place statements after case label
"              +------------------------------- placement of case after switch statement

"buffers
set hidden                                      "allow hiding of buffers without saving changes

"command line features
set wildchar=<Tab>
set wildmenu
set wildmode=longest,list,full "(see http://vim.wikia.com/wiki/Easier_buffer_switching)
set wildignore=*/tmp/*,*.swp,*.o,*.gch,*.pyc,*.jpg,*.gif,*.png,*.a,*.so

"editing text
set backspace=indent,eol,start
if has("persistent_undo")                       "persist undo/redo history on disk
    set undofile
    set undodir=~/.vim/undo
endif
set formatoptions-=t                            "do not autowrap text while typing
set pastetoggle=<leader>p                       "\+p toggles paste mode

"searching text
set hlsearch                                    "highlight all search matches
set incsearch                                   "enable incremental search
set ignorecase
set smartcase                                   "override ignorecase option if uppercase

"displaying text
set nowrap                                      "do not wrap lines in the display
set number                                      "show line numbers

"miscellaneous display settings
set showcmd                                     "show partial command in last line of screen
set showmode                                    "put a message on the last line in certain modes
set ruler                                       "show comma-separated cursor line+column number

"encoding
set encoding=utf-8

"gvim-specific settings
if has('gui_running')
    set guioptions+=b                           "show horizontal scrollbar
    set list                                    "show unprintable characters
    set listchars=trail:_                       "show trailing whitespace with a '_'
    let &colorcolumn=join(range(80,999),",")    "highlight column 80 onwards
    let &guifont = fontdetect#firstFontFamily([
                 \ "Ubuntu Mono",
                 \ "DejaVu Sans Mono",
                 \ "Monospace"]) . " 8"         "select font and size
endif
