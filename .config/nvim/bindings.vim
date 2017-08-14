" disable arrow keys
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" commands for split movement
if !exists(':Wh')
  command Wh wincmd h
  command Wj wincmd j
  command Wk wincmd k
  command Wl wincmd l
endif

" adds :H command for opening help in same window
function! s:help(subject)
  let buftype  = &buftype
  let &buftype = 'help'
  let v:errmsg = ''
  let cmd      = "help " . a:subject

  silent! execute  cmd
  if v:errmsg != ''
    let &buftype = buftype
    return cmd
  else
    call setbufvar('#', '&buftype', buftype)
  endif
endfunction

command! -nargs=? -bar -complete=help H execute <SID>help(<q-args>)
