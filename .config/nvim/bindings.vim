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
