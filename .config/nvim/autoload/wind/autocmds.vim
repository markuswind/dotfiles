let g:WindColorColumnBlacklist = ['diff', 'fugitiveblame', 'vimfiler', 'qf', 'command-t']
let g:WindCursorlineBlacklist  = ['command-t']

function! wind#autocmds#should_colorcolumn() abort
  return index(g:WindColorColumnBlacklist, &filetype) == -1
endfunction

function! wind#autocmds#should_cursorline() abort
  return index(g:WindCursorlineBlacklist, &filetype) == -1
endfunction

function! wind#autocmds#blur_window() abort
  if wind#autocmds#should_colorcolumn()
    ownsyntax off
  endif
endfunction

function! wind#autocmds#focus_window() abort
  if wind#autocmds#should_colorcolumn()
    if !empty(&ft)
      ownsyntax on
    endif
  endif
endfunction

function! wind#autocmds#blur_statusline() abort
  " TODO: - fix terminal name here
  " Default blurred statusline (buffer number: filename).
  let l:blurred='%{wind#statusline#gutterpadding()}'
  let l:blurred.='\ ' " space
  let l:blurred.='\ ' " space
  let l:blurred.='\ ' " space
  let l:blurred.='\ ' " space
  let l:blurred.='%<' " truncation point
  let l:blurred.='%f' " filename
  let l:blurred.='%=' " split left/right halves (makes background cover whole)
  call s:update_statusline(l:blurred, 'blur')
endfunction

function! wind#autocmds#focus_statusline() abort
  " `setlocal statusline=` will revert to global 'statusline' setting.
  call s:update_statusline('', 'focus')
endfunction

function! s:update_statusline(default, action) abort
  let l:statusline = s:get_custom_statusline(a:action)
  if type(l:statusline) == type('')
    " Apply custom statusline.
    execute 'setlocal statusline=' . l:statusline
  elseif l:statusline == 0
    " Do nothing.
    "
    " Note that order matters here because of Vimscript's insane coercion rules:
    " when comparing a string to a number, the string gets coerced to 0, which
    " means that all strings `== 0`. So, we must check for string-ness first,
    " above.
    return
  else
    execute 'setlocal statusline=' . a:default
  endif
endfunction

function! s:get_custom_statusline(action) abort
  if &ft ==# 'command-t'
    " Will use Command-T-provided buffer name, but need to escape spaces.
    return '\ \ ' . substitute(bufname('%'), ' ', '\\ ', 'g')
  elseif &ft ==# 'diff' && exists('t:diffpanel') && t:diffpanel.bufname ==# bufname('%')
    return 'Undotree\ preview' " Less ugly, and nothing really useful to show.
  elseif &ft ==# 'vimfiler'
    return 'Vimfiler'
  elseif &ft ==# 'qf'
    if a:action ==# 'blur'
      return 'Quickfix'
    else
      return g:WindQuickfixStatusline
    endif
  endif

  return 1 " Use default.
endfunction
