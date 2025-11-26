set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set number
set hlsearch
set incsearch
set ignorecase
set termguicolors

call plug#begin('~/vimfiles/plugged')
    Plug 'sainnhe/everforest'
call plug#end()

" Цветовая схема
colorscheme everforest

let mapleader = " "
" Сетапы для разных типов файлов
" autocmd filetype cs call CSharpSetup()

" Хоткеи
inoremap jk <ESC><Right>
inoremap kj <ESC><Right>
inoremap <C-p> <Right>
" Русские хоткеи
inoremap <C-р> <BackSpace>
inoremap <C-з> <BackSpace>
