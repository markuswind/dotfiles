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

" adds :Vterm command for opening term buffer in vertical split
" adds :Sterm command opening term buffer in horizontal split
function! s:OpenTerminalInVerticalSplit()
  vsplit
  terminal
endfunction

function! s:OpenTerminalInHorizontalSplit()
  split
  terminal
endfunction

command! Vterm call s:OpenTerminalInVerticalSplit()
command! Sterm call s:OpenTerminalInHorizontalSplit()
