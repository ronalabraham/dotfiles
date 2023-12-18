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

"toggle tab size between 2 and 4
function! TabToggle()
    if(&tabstop == 4)
        call TabSet(2)
    else
        call TabSet(4)
    endif
endfunc

"toggle display of unprintable characters
function! UnprintableToggle()
    if(&list == 0)
        let &list=1
    else
        let &list=0
    endif
endfunc

function! ColorColumnToggle()
    if(&colorcolumn == 0)
        let l:ccwidth = 80
        if (&ft=='go')
            let l:ccwidth = 121
        elseif (&ft=='gitcommit')
            let l:ccwidth = 72
        endif
        let &colorcolumn=join(range(l:ccwidth,999),",")
    else
        let &colorcolumn=0
    endif
endfunc

"toggle auto-wrapping while editting
function! EditAutoWrapToggle()
    if &formatoptions =~ 't'
        set formatoptions-=t
    else
        set formatoptions+=t
    endif
endfunction

"trim trailing whitespace (interactively)
function! TrimTrailingWhitespaces()
    %s/\s\+$//gce
endfunction

"get OS Platform
function! GetPlatform()
    if has('win32') || has('win64')
        return "Windows"
    elseif has("unix")
        return substitute(system("uname"), "\n", "", "g")
    else
        return "Unknown"
    endif
endfunction

"check if running in WSL (Windows subsystem for Linux)
function! IsWSL()
    if has("unix") && filereadable("/proc/version")
        let lines = readfile("/proc/version")
        if lines[0] =~ "Microsoft"
            return 1
        endif
    endif
    return 0
endfunction


"build YouCompleteMe compiled component
"    https://github.com/junegunn/vim-plug#post-update-hooks
function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.status == 'updated' || a:info.force
        silent !./install.py
                             "--clang-completer (disabling clang-completer for
                             "now; it's too noisy for C++ until I can fix it)
    endif
endfunction

"Put selection into Windows clipboard using clip.exe; adapted from
"    https://vim.fandom.com/wiki/Using_the_Windows_clipboard_in_Cygwin_Vim
function! PutClip(type, ...) range
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@
    if a:type == 'n'
        silent exe a:firstline . "," . a:lastline . "y"
    elseif a:type == 'c'
        silent exe a:1 . "," . a:2 . "y"
    else
        silent exe "normal! `<" . a:type . "`>y"
    endif

    call system('clip.exe', @@) " if you're using Bash on Windows

    let &selection = sel_save
    let @@ = reg_save
endfunction

"Get content from  Windows clipboard using powershell.exe; adapted from:
"    https://vim.fandom.com/wiki/Using_the_Windows_clipboard_in_Cygwin_Vim
"    https://github.com/microsoft/WSL/issues/1069
function! GetClip()
    let reg_save = @@
    "Remove Windows line-endings; inspired by:
    "    https://stackoverflow.com/a/56584029 
    let @@ = system('powershell.exe Get-Clipboard | perl -p -e "s/\r\n$/\n/"')
    setlocal paste
    exe 'normal p'
    setlocal nopaste
    let @@ = reg_save
endfunction
