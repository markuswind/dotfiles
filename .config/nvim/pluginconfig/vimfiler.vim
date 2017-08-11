let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_time_format          = ''
let g:vimfiler_ignore_pattern       = ['^\.git$', '^\.DS_Store$']

if !exists(':Es')
  command Es VimFilerSplit
endif
