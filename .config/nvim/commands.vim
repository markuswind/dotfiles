" commands for split movement
if !exists(':Wh')
  command Wh wincmd h
  command Wj wincmd j
  command Wk wincmd k
  command Wl wincmd l
endif

" adds :TODOS command for opening todosfile
" adds :GOALS command for opening goals file
function! s:OpenTodos()
    edit $TODOS
endfunction

function! s:OpenGoals()
    edit $GOALS
endfunction

command! TODOS call s:OpenTodos()
command! GOALS call s:OpenGoals()

" adds :Ub command for opening Unite buffer
" adds :Uf command for opening Unite file
function! s:BufferSelect() 
    Unite buffer
endfunction

function! s:BufferFile()
    Unite file
endfunction

command! Ub call s:BufferSelect()
command! Uf call s:BufferFile()

" adds :Zt
"      +ZoomToggle command for zooming/restoring window
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction

command! ZoomToggle call s:ZoomToggle()
command! Zt call s:ZoomToggle()

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
