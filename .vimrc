set wrap linebreak nolist
set encoding=utf-8
autocmd InsertLeave * write

syntax on
set textwidth=0
"set colorcolumn=+1

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set undofile
set incsearch
set relativenumber
"
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"set colorcolumn=71
"highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
Plug 'dense-analysis/ale'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'

call plug#end()

syntax enable
set background=dark
colorscheme onedark
"colorscheme iceberg 
"colorscheme solarized
"colorscheme gruvbox 
"colorscheme dracula
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>

nnoremap <silent> <Leader>> :vertical resize +5<CR>
nnoremap <silent> <Leader>< :vertical resize -5<CR>
nnoremap <silent> <Leader>- :resize -5<CR>
nnoremap <silent> <Leader>+ :resize +5<CR>
nnoremap <silent> <Leader>= :resize<CR>

nnoremap <leader>ov :exe ':silent !code-insiders %'<CR>:redraw!<CR>
nnoremap <leader>od :exe ':silent !xdg-open %'<CR>:redraw!<CR>
"Clear highlights on hitting ESC twice
nnoremap <silent> <Esc><Esc> :noh<CR> :call clearmatches()<CR>
"remapping space to leader+space  in normal mode
nnoremap <silent> <Leader><Space> i<Space><Esc>

noremap ,v :split<enter>
nnoremap ,s :vsplit<enter>
nnoremap ,r <C-w>r 
nnoremap ,x <C-w>c 
nnoremap ,o <C-w>o

"run shell scripts
autocmd FileType sh nnoremap <leader>rs :exec '!sh' shellescape(@%, 1)<cr>


set autoread
if ! exists("g:CheckUpdateStarted")
    let g:CheckUpdateStarted=1
    call timer_start(1,'CheckUpdate')
endif
function! CheckUpdate(timer)
    silent! checktime
    call timer_start(1000,'CheckUpdate')
endfunction
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime

"nerd treee settings "
"map <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"run C file
"let mycommand = ':!gcc % -o %< && echo "%<" && [ $(pwd) == "." ] && %< || ./%< '
"nnoremap <silent> <Leader>cc :!clear && gcc % <CR>
"nnoremap <Leader>rc :!clear && gcc % -o %< && ./%< && read <CR>
autocmd FileType c
   \ set makeprg=gcc\ -Wall\ %\ -o\ out |
   \ nnoremap <Leader>rc :w!<cr>:make<cr>:!./out

"templated settings
source ~/.vim/templates/py_config/py.vim

"ale settings for pthon
let g:ale_linters = {'pthon':['flake8', 'pydocstyle', 'bandit', 'mypy']}
let g:ale_fixers = {'*': [], 'python': ['black', 'isort']}
let g:ale_fix_on_save = 1
