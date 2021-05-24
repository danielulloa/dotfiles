" Directorio de los plugins
call plug#begin('~/AppData/Local/nvim/plugged')

" ----------------------
" Plugins de funcionalidad
" ----------------------

" Verificacion de sintaxis
Plug 'vim-syntastic/syntastic'

" Autocompletado
" requiere nodejs >= 10.12
Plug 'neoclide/coc.nvim'

" Arbol de archivos
Plug 'preservim/nerdtree' |
\ Plug 'Xuyuanp/nerdtree-git-plugin' |
\ Plug 'ryanoasis/vim-devicons'

" ----------------------
" Plugins esteticos
" ----------------------
" Barra de estado con simbolos powerline
Plug 'vim-airline/vim-airline'

" Temas para la barra de estado
Plug 'vim-airline/vim-airline-themes'


" Esquemas de colores
Plug 'rafi/awesome-vim-colorschemes'

" Iconos para nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" tema muy oscuro
Plug 'bratpeki/truedark-vim'

" menu inicio
Plug 'mhinz/vim-startify'

"-----------------------
" Plugins específicos
"-----------------------

" LaTeX
Plug 'lervag/vimtex'

" Inicializar sistema de plugins
call plug#end()

autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif

" tema
set background=dark
set termguicolors
colorscheme truedark
" Path de python
let g:python3_host_prog = 'C:/Python38/python.exe'

" wrap long lines
set wrap lbr

" numeros de lineas relativas
set number

" resalta linea actual
set cursorline

" codificacion
set encoding=utf-8

set mouse=a
set noshowmode
set clipboard+=unnamedplus
set nocompatible
set number relativenumber

" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0

" configuracion de splits
set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Sintaxis
syntax on

" Indentacion
set autoindent
set smartindent

" air-line
let g:airline_powerline_fonts = 1
let g:airline3extensions3tabline3enabled = 1

" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
	return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
	if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
		NERDTreeFind
		wincmd p
	endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" Shortcuts
let mapleader=" "
nmap <Leader>t :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
