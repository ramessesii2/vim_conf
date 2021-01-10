"read this template into every file with .py extension
:autocmd BufNewFile *.py 0r ~/.vim/templates/py_config/init.py

autocmd FileType python inoremap <buffer> ;init <C-\><C-O>:read ~/.vim/templates/py_config/init.py<CR>
autocmd FileType python inoremap <buffer> ;bis <C-\><C-O>:read ~/.vim/templates/py_config/bis.py<CR>
autocmd FileType python inoremap <buffer> ;sys <C-\><C-O>:read ~/.vim/templates/py_config/sys.py<CR>

autocmd FileType python :imap <buffer> ;for <C-O>mzfor %%% in %%%(%%%):<CR>%%%<C-O>'z;;
autocmd FileType python :imap <buffer> ;; <C-O>/%%%<CR><C-O>c3l
autocmd FileType python :nmap <buffer> ;; /%%%<CR>c3l

" Bind F5 to save file if modified and execute python script in a buffer.
autocmd FileType python nnoremap <silent> <leader>rp :call SaveAndExecutePython()<CR>
autocmd FileType python nnoremap <leader>arp :exec '!python' shellescape(@%, 1)<cr>
autocmd FileType python vnoremap <silent> <leader>rp :call SaveAndExecutePython()<CR>

function! SaveAndExecutePython()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "Python"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction

"specific configuratin of splits for competitive programming
nnoremap <leader>dtc :vsplit<bar> :wincmd l<bar> :vertical resize -38<bar> :e in.txt<bar> :split<bar> :wincmd j<bar> :e out.txt<bar> :wincmd h<CR>    
