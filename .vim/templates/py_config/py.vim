:autocmd BufNewFile *.py 0r ~/.vim/templates/py_config/init.py
autocmd FileType python inoremap <buffer> ;init <C-\><C-O>:read ~/.vim/templates/py_config/init.py<CR>
autocmd FileType python inoremap <buffer> ;bis <C-\><C-O>:read ~/.vim/templates/py_config/bis.py<CR>
autocmd FileType python inoremap <buffer> ;sys <C-\><C-O>:read ~/.vim/templates/py_config/sys.py<CR>
autocmd FileType python :imap <buffer> ;for <C-O>mzfor %%% in %%%(%%%):<CR>%%%<C-O>'z;;
autocmd FileType python :imap <buffer> ;; <C-O>/%%%<CR><C-O>c3l
autocmd FileType python :nmap <buffer> ;; /%%%<CR>c3l

