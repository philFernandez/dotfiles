au BufEnter * setlocal ft=notes
" allows editing and line wrapping

" insert bullet point
imap <leader>w <esc><space><space>*<space>
"nmap <leader>w I<esc><space><space>*<space>
" Remove bullet point
nmap <leader>q I<delete><space><esc>A

setlocal nonumber
"autocmd BufEnter * ++once setfiletype notes
setlocal tw=85
setlocal foldenable

nnoremap <leader>w :call vimnotes#doMyMarkDown#DoMarkDownThingNow()<CR>
nnoremap <leader>v :call vimnotes#doMyMarkDown#DoMarkDownHw()<CR>
