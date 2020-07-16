" Check CMake files with the following linters
let b:ale_linters = [ 'cmakelint' ]

" Fix CMake files with the following fixers
let b:ale_fixers = [ 'cmakeformat' ]

" I am using cmake-lint (see https://github.com/cheshirekow/cmake_format)
" instead of cmakelint (see https://github.com/cmake-lint/cmake-lint)
let g:ale_cmake_cmakelint_executable='cmake-lint'

" local customization in ~/.vimrc_local
let $CMAKELOCALFILE=expand("~/.vim_local/ftplugin/cmake.vim")
if filereadable($CMAKELOCALFILE)
    source $CMAKELOCALFILE
endif
