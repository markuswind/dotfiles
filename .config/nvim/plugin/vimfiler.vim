let g:vimfiler_as_default_explorer        = 1
let g:vimfiler_safe_mode_by_default       = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimfiler_time_format                = ''

let g:vimfiler_ignore_pattern = [
\   '^\.git$', '^\.DS_Store$'
\ ]

if !exists(':VE')
  command VE VimFilerExplorer
endif

call vimfiler#custom#profile('default', 'context', {
\   'safe': 0,
\   'explorer': 1
\ })
