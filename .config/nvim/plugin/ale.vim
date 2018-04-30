" Theming

let g:ale_sign_error = ''
let g:ale_sign_warning = ''

" Linting

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0

let g:ale_linters = {
\   'typescript': ['tslint', 'tsserver'],
\}

" Prettier
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['typescript'] = ['prettier']

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1

" Completion
let g:ale_completion_enabled = 1

let g:ale_completion_max_suggestions = 15
let g:ale_completion_delay = 300
