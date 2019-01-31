" Examine the output of a vim command in a temporary buffer; takes ideas from:
"     https://vi.stackexchange.com/questions/8378/dump-the-output-of-internal-vim-command-into-buffer
"     http://vim.wikia.com/wiki/Vim_buffer_FAQ
" Examples
"     :Redir ALEInfo     # debug ALE
"     :Redir scriptnames # list all scripts sourced by vim
command! -nargs=+ -complete=command Redir let s:reg = @@
            \| redir @">
            \| silent execute <q-args>
            \| redir END
            \| enew
            \| pu
            \| 1,2d_
            \| let @@ = s:reg
            \| setlocal buftype=nofile
            \| setlocal bufhidden=hide
            \| setlocal noswapfile
