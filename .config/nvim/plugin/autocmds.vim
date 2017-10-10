if has('autocmd')
  augroup WindAutocmds
    autocmd!

    if has('nvim')
      " Sync with corresponding non-nvim settings in ~/.nvim/config/general.vim:
      autocmd ColorScheme * highlight! link NonText ColorColumn
      autocmd ColorScheme * highlight! link CursorLineNr DiffText
      autocmd ColorScheme * highlight! link VertSplit LineNr
    endif

    if exists('+winhighlight')
      autocmd BufEnter,FocusGained,VimEnter,WinEnter * if wind#autocmds#should_colorcolumn() | set winhighlight= | endif
      autocmd FocusLost,WinLeave * if wind#autocmds#should_colorcolumn() | set winhighlight=CursorLineNr:LineNr,IncSearch:ColorColumn,Normal:ColorColumn,NormalNC:ColorColumn,SignColumn:ColorColumn | endif
    elseif exists('+colorcolumn')
      autocmd BufEnter,FocusGained,VimEnter,WinEnter * if wind#autocmds#should_colorcolumn() | let &l:colorcolumn='+' . join(range(0, 254), ',+') | endif
      autocmd FocusLost,WinLeave * if wind#autocmds#should_colorcolumn() | let &l:colorcolumn=join(range(1, 255), ',') | endif
    endif

    autocmd InsertLeave,VimEnter,WinEnter * if wind#autocmds#should_cursorline() | setlocal cursorline | endif
    autocmd InsertEnter,WinLeave * if wind#autocmds#should_cursorline() | setlocal nocursorline | endif

    if has('statusline')
      " TODO: move this into statusline.vim? or move autocmd stuff in statusline.vim
      " here?
      autocmd BufEnter,FocusGained,VimEnter,WinEnter * call wind#autocmds#focus_statusline()
      autocmd FocusLost,WinLeave * call wind#autocmds#blur_statusline()
    endif

    autocmd BufEnter,FocusGained,VimEnter,WinEnter * call wind#autocmds#focus_window()
    autocmd FocusLost,WinLeave * call wind#autocmds#blur_window()
  augroup end
end
