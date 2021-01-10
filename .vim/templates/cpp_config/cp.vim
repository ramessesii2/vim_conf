
"read this template into every file with .cpp extension
:autocmd BufNewFile *.cpp 0r ~/.vim/templates/cpp_config/init.cpp

autocmd FileType cpp inoremap <buffer> ;init <C-\><C-O>:read ~/.vim/templates/cpp_config/init.cpp<CR>
autocmd FileType cpp inoremap <buffer> ;2init <C-\><C-O>:read ~/.vim/templates/cpp_config/2init.cpp<CR>
autocmd FileType cpp :imap <buffer> ;; <C-O>/%%%<CR><C-O>c3l
autocmd FileType cpp :nmap <buffer> ;; /%%%<CR>c3l


