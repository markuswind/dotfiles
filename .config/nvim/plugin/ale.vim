let g:ale_sign_error                 = ''
let g:ale_sign_warning               = ''

let g:ale_lint_on_enter              = 0
let g:ale_lint_on_text_changed       = 0

let g:ale_linters = {
\   'typescript': ['tslint'],
\}

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1
