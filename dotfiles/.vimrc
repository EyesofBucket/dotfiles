set nu
nnoremap <Space> i_<Esc>r

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:airline_theme='deus'

set mouse=a

set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cindent