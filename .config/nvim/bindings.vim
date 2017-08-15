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

" keys for split movement
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

" adds :Sb           <pattern>
"      +SelectBuffer <pattern> command for switching buffers
" adds :Lb
"      +ListBuffers            command for listing/switching all buffers
function! SelectBuffer(pattern)
  let bufcount           = bufnr("$")
  let currbufnr          = 1
  let nummatches         = 0
  let firstmatchingbufnr = 0

    while currbufnr <= bufcount
        if(bufexists(currbufnr))
            let currbufname = bufname(currbufnr)
            if(match(currbufname, a:pattern) > -1)
                echo currbufnr . ": ". bufname(currbufnr)
                let nummatches += 1
                let firstmatchingbufnr = currbufnr
            endif
        endif
    let currbufnr = currbufnr + 1
    endwhile

    if(nummatches == 1)
        execute ":buffer ". firstmatchingbufnr
    elseif(nummatches > 1)
        let desiredbufnr = input("Enter buffer number: ")

        if(strlen(desiredbufnr) != 0)
            execute ":buffer ". desiredbufnr
        endif
    else
        echo "No matching buffers"
    endif
endfunction

command! -nargs=1 Sb :call SelectBuffer("<args>")
command! -nargs=1 SelectBuffer :call SelectBuffer("<args>")
command! -nargs=0 Lb :call SelectBuffer(".*")
command! -nargs=0 ListBuffers :call SelectBuffer(".*")

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
