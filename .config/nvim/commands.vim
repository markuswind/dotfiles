" commands for split movement
if !exists(':Wh')
  command Wh wincmd h
  command Wj wincmd j
  command Wk wincmd k
  command Wl wincmd l
endif

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
