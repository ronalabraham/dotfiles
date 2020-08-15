"Check CMake files with the following linters
let b:ale_linters = [
            \'flake8',
            \'mypy',
            \'pylint']

"Fix CMake files with the following fixers
let b:ale_fixers = [
            \'remove_trailing_lines',
            \'trim_whitespace',
            \'isort',
            \'black']

"isort options
let b:ale_python_isort_options = "-w=79 -m=3"

"black options
let b:ale_python_black_options = "--line-length 79"

" local customization in ~/.vimrc_local
let $PYTHONLOCALFILE=expand("~/.vim_local/ftplugin/python.vim")
if filereadable($PYTHONLOCALFILE)
    source $PYTHONLOCALFILE
endif
