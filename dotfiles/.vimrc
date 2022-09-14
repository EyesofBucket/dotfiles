set nu
nnoremap <Space> i_<Esc>r

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
call plug#end()

let g:airline_theme='deus'
let g:airline_powerline_fonts = 1

set mouse=a

set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cindent
