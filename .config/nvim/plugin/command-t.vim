nnoremap <C-p> :CommandT<Cr>
nnoremap <C-b> :CommandTBuffer<Cr>

" TODO: fix string being too long..
let g:CommandTWildIgnore=&wildignore . ",*.pyc,node_modules,assets,builds,ios,build,Carthage,coverage,gradle,cicd,cypress,dist,error_pages"

let g:CommandTMaxHeight = 8
let g:CommandTInputDebounce = 50

if &term =~ "xterm" || &term =~ "screen"
  let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif
