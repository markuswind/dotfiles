" deletes empty lines without affecting unnamed register
" FIXME: this is not working..
nnoremap <expr> dd (getline('.') =~ '^\s*$' && v:register == '"' ? '"_' : '').'dd'

" toggle fold at current position
nnoremap <s-tab> za

" keys for split movement
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>

" clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
