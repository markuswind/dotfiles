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

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
"
" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

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

" The following lets you type Ngb to jump to buffer number N (a number from 1 to 99). 
" For example, typing 12gb would jump to buffer 12.
let c = 1
while c <= 99
  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
  let c += 1
endwhile
