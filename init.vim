let mapleader=" "

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mattn/emmet-vim'
Plug 'vimwiki/vimwiki'
Plug '/usr/share/fzf'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'karoliskoncevicius/vim-sendtowindow'

call plug#end()

set title
filetype plugin on
set cursorline
:hi CursorLine   cterm=NONE ctermbg=black ctermfg=white guibg=darkgrey guifg=white
set number relativenumber
set nocompatible
syntax on
set wildmode=longest,list,full
set splitbelow splitright " splits open bellow and right






" Map goyo to space+f:
map <leader>f :Goyo \| set linebreak<CR>

" Map NERDTree to leader n 

map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


map <leader>w :w!<CR>
map <leader>q :q!<CR>
map <leader>z :wq!<CR>

" disable auto commenting on next line 
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" Change vim splits binds:

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Emmet settings:


let g:user_emmet_mode='n'
let g:user_emmet_leader_key=','


:au FocusLost * :wa
:au FocusLost * silent! wa
:set autowriteall


" FZF
map <leader>o :FZF ~<Enter>

let g:fzf_layout = { 'up': '35%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

command! LS call fzf#run(fzf#wrap({'source': 'du -a /home/filip', 'sink': 'e'}))
  

" Folding

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


inoremap <leader><leader> <Esc>/<+-+<enter>"_ca<

" LaTeX shortcuts
autocmd FileType tex inoremap ;s1 \section{}<enter><enter><+-+><Esc>?{}<enter>a
autocmd FileType tex inoremap ;s2 \subsection{}<enter><enter><+-+><Esc>?{}<enter>a
autocmd FileType tex inoremap ;s3 \subsubsection{}<enter><enter><+-+><Esc>?{}<enter>a
autocmd FileType tex inoremap ;p1 \paragraph{}<enter><enter><+-+><Esc>?{}<enter>a
autocmd FileType tex inoremap ;p2 \subparagraph{}<enter><enter><+-+><Esc>?{}<enter>a
autocmd FileType tex inoremap ;p3 \subsubparagraph{}<enter><enter><+-+><Esc>?{}<enter>a
autocmd FileType tex inoremap ;tc \textcite{}<+-+><Esc>?{}<enter>a
autocmd FileType tex inoremap ;pc \parencite{}<+-+><Esc>?{}<enter>a
autocmd FileType tex inoremap ;i \textit{}<+-+><Esc>?{}<enter>a
autocmd FileType tex inoremap ;b \textbf{}<+-+><Esc>?{}<enter>a
autocmd FileType tex inoremap ;l \begin{itemize}<enter><enter><+-+><enter><enter>\end{itemize}<Esc>?<+-+><enter>nca<
autocmd FileType tex inoremap ;bp \item[$\ast$]<space><+-+><enter><+-+><Esc>?<+-+><CR>nca<
autocmd FileType tex inoremap ;np \item<space><+-+><enter><+-+><Esc>?<+-+><CR>nca<




autocmd FileType * noremap j gj
autocmd FileType * noremap k gk

" Signal to SXHKD to reload after saving the config file
autocmd BufWritePost sxhkdrc :!id=$(pgrep sxhkd); kill -s SIGUSR1 $id




noremap ;c "+y
noremap ;var A)<Esc>I=$(<Esc>I


let pairs = { "(" : ")",
			\ "{" : "}",
			\ "[" : "]",
			\ "'" : "'",
			\ "\"" : "\"",
			\ "*" : "*",
			\ "<" : ">",
			\ "-" : "-" }

for [key, value] in items(pairs)
	exe "autocmd FileType * inoremap ;".key." ".key.value."<+-+><Esc>F".value."i"
	exe "autocmd FileType * inoremap ;".value." ".key.value."<+-+><Esc>F".value."i"
endfor

noremap <F3> :vsp <CR> :terminal<CR>
tnoremap <Esc> <C-\><C-n>
map <F9> :w! \| !compile `pwd`/%<CR><CR>

map <C-s>l :vsp<CR>
map <C-s>j :sp<CR>
"map <C-S-h> :vertical resize -5<CR>
"map <C-S-l> :vertical resize +5<CR>
"map <C-S-j> :resize +5<CR>
"map <C-S-k> :resize -5<CR>
