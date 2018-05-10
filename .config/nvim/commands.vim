" adds :NOTES command for opening notes file 
" adds :GOALS command for opening goals file
function! s:OpenNotes()
    edit $NOTES
endfunction

function! s:OpenGoals()
    edit $GOALS
endfunction

command! NOTES call s:OpenNotes()
command! GOALS call s:OpenGoals()

" adds :SetProjectRoot command ..
" for settting working directory to git project root
" or directory of current file if not git project
function! SetProjectRoot()
  lcd %:p:h

  let git_dir        = system("git rev-parse --show-toplevel")
  let is_not_git_dir = matchstr(git_dir, '^fatal:.*')

  if empty(is_not_git_dir)
    lcd `=git_dir`
  endif
endfunction

command! SetProjectRoot :call SetProjectRoot()

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
