"vim settings

syntax on

"miscellaneous
set nocompatible
set noesckeys                                   "stop annoying delay when
                                                "pressing Esc key
"read :help noesckeys. This causes function and arrow keys to stop working in
"insert mode. An alternative option is to play with timeoutlen and ttimeoutlen.
"See the following URL for more info:
"https://vi.stackexchange.com/questions/10249/what-is-the-difference-between-mapped-key-sequences-and-key-codes-timeoutl

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
set wildmode=longest,list,full "(see vim.wikia.com/wiki/Easier_buffer_switching)
set wildignore=*/tmp/*,*.swp,*.o,*.gch,*.pyc,*.jpg,*.gif,*.png,*.a,*.so

"editing text
set backspace=indent,eol,start
if has("persistent_undo")                       "persist undo/redo history on disk
    set undofile
    set undodir=~/.vim/undo
endif
set formatoptions-=t                            "do not autowrap text while typing
set pastetoggle=<F10>                           "F1O toggles paste mode

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

"more natural split opening
"  thoughtbot.com/blog/vim-splits-move-faster-and-more-naturally
set splitbelow
set splitright

"spelling (in normal mode: z= to suggest corrections, zg to add word to the dictionary)
set spell spelllang=en_us spellfile=~/.vim/spell/en.utf-8.add

"enable use of the mouse
"  https://vi.stackexchange.com/a/521
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

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
