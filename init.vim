let mapleader=" "

call plug#begin('~/local/share/nvim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mattn/emmet-vim'
Plug 'vimwiki/vimwiki'

call plug#end()

set number relativenumber
set nocompatible
syntax on
set wildmode=longest,list,full

" Map goyo to space+f:
map <leader>f :Goyo \| set linebreak<CR>
" Change vim splits binds:

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Emmet settings:


let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','
