" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" Prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
autocmd BufWritePost * Prettier
