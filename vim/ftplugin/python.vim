"Check CMake files with the following linters
let b:ale_linters = [
            \"flake8",
            \"mypy",
            \"pydocstyle",
            \"pylint"]

"Fix CMake files with the following fixers
let b:ale_fixers = [
            \"remove_trailing_lines",
            \"trim_whitespace",
            \"isort",
            \"black"]

"flake8 options
let g:ale_python_flake8_executable = "python3"
let g:ale_python_flake8_options = "-m flake8"

"pylint options
let g:ale_python_pylint_executable = "python3"
let g:ale_python_pylint_options = "-m pylint"

"isort options
let g:ale_python_isort_options = "-w=79 -m=3"

"black options
let g:ale_python_black_options = "--line-length 79"

" local customization in ~/.vimrc_local
let $PYTHONLOCALFILE=expand("~/.vim_local/ftplugin/python.vim")
if filereadable($PYTHONLOCALFILE)
    source $PYTHONLOCALFILE
endif
