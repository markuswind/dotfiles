if has('autocmd')
  augroup WindAutocmds
    if has('statusline')
      " TODO: move this into statusline.vim? or move autocmd stuff in statusline.vim
      " here?
      autocmd BufEnter,FocusGained,VimEnter,WinEnter * call wind#autocmds#focus_statusline()
      autocmd FocusLost,WinLeave * call wind#autocmds#blur_statusline()
    endif
  augroup end
end
