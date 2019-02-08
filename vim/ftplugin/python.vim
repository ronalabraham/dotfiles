
"Check Python files with the following linters
let b:ale_linters = [
            \'pycodestyle',
            \'flake8',
            \'mypy',
            \'pylint']

"Fix Python files with the following fixers
let b:ale_fixers = ['isort', 'black']

"isort options
let b:ale_python_isort_options = "--line-width=79 --multi_line=3"

"black options
let b:ale_python_black_options = "--line-length 79"
