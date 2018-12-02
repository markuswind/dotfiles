function s:CheckColorScheme()
  " Make comments italicized
  execute 'highlight Comment ' . pinnacle#italicize('Comment')

  " Make tildes at EndOfBuffer less obvious.
  let l:color=pinnacle#extract_bg('ColorColumn')
  let l:highlight=pinnacle#highlight({'bg': l:color, 'fg': l:color})
  execute 'highlight EndOfBuffer ' . l:highlight

   " Allow for overrides:
  " - `statusline.vim` will re-set User1, User2 etc.
  " - `after/plugin/loupe.vim` will override Search.
  doautocmd ColorScheme
endfunction

if v:progname !=# 'vi'
  if has('autocmd')
    augroup WindAutoColor
      autocmd!
      autocmd FocusGained * call s:CheckColorScheme()
    augroup END
  endif

  call s:CheckColorScheme()
endif
