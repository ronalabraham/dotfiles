"vim functions

"increment or decrement font size; from:
"vi.stackexchange.com/questions/3093/how-can-i-change-the-font-size-in-gvim
if has("gui_gtk2")
    function! FontSizePlus ()
        let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
        let l:gf_size_whole = l:gf_size_whole + 1
        let l:new_font_size = ' '.l:gf_size_whole
        let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
        let l:gf_size_whole = matchstr(&guifont, '\( \)\@<=\d\+$')
        let l:gf_size_whole = l:gf_size_whole - 1
        let l:new_font_size = ' '.l:gf_size_whole
        let &guifont = substitute(&guifont, ' \d\+$', l:new_font_size, '')
    endfunction
else
    function! FontSizePlus ()
        let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
        let l:gf_size_whole = l:gf_size_whole + 1
        let l:new_font_size = ':h'.l:gf_size_whole
        let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction

    function! FontSizeMinus ()
        let l:gf_size_whole = matchstr(&guifont, '\(:h\)\@<=\d\+$')
        let l:gf_size_whole = l:gf_size_whole - 1
        let l:new_font_size = ':h'.l:gf_size_whole
        let &guifont = substitute(&guifont, ':h\d\+$', l:new_font_size, '')
    endfunction
endif

"go to insert mode, unless the cursor is on the last character, in which case,
"go into append mode
function! InsertOrAppendMode()
    if col(".") < col("$") - 1
        :startinsert
    else
        :startinsert!
    endif
endfunc

"sets tab size to 'numSpaces'
function! TabSet(numSpaces)
    let &tabstop=a:numSpaces
    let &softtabstop=a:numSpaces
    let &shiftwidth=a:numSpaces
    echo "Tabsize set to" a:numSpaces "spaces"
endfunc

"toggles tab size between 2 and 4
function! TabToggle()
    if(&tabstop == 4)
        call TabSet(2)
    else
        call TabSet(4)
    endif
endfunc

"toggles display of unprintable characters
function! UnprintableToggle()
    if(&list == 0)
        let &list=1
    else
        let &list=0
    endif
endfunc

function! ColorColumnToggle()
    if(&colorcolumn == 0)
        let &colorcolumn=join(range(80,999),",")
    else
        let &colorcolumn=0
    endif
endfunc

function! TrimTrailingWhiteSpace()
    %s/\s\+$//gce
endfunction
