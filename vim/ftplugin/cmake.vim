" Both cmake-lint and cmake-format are from:
"   https://github.com/cheshirekow/cmake_format

" Check CMake files with the following linters
let b:ale_linters = [ 'cmake_lint' ]

" Fix CMake files with the following fixers
let b:ale_fixers = [ 'cmakeformat' ]

let g:ale_cmake_cmake_lint_executable = "python3"
let g:ale_cmake_cmake_lint_options    = "-m cmakelang.lint"

let g:ale_cmake_cmakeformat_executable = "python3"
let g:ale_cmake_cmakeformat_options    = "-m cmakelang.format"

" local customization in ~/.vimrc_local
let $CMAKELOCALFILE=expand("~/.vim_local/ftplugin/cmake.vim")
if filereadable($CMAKELOCALFILE)
    source $CMAKELOCALFILE
endif
