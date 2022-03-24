" Configura vimplug, especifica directorio
call plug#begin('~/AppData/Local/nvim/plugged')

" --------------------
" plugins de funcionalidad
" --------------------

" Verificacion de sintaxis
Plug 'vim-syntastic/syntastic'

" Autocompletado
" requiere nodejs >= 10.12
Plug 'neoclide/coc.nvim'

" Arbol de archivos
Plug 'preservim/nerdtree' |
			\ Plug 'Xuyuanp/nerdtree-git-plugin' |
			\ Plug 'ryanoasis/vim-devicons'

" Parentesis y corchetes de colores
Plug 'junegunn/rainbow_parentheses.vim'

" Multiples cursores
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" --------------------
"  plugins esteticos
" --------------------

" Barra de estados
" necesita patched fonts powerline
Plug 'vim-airline/vim-airline'

" Temas para barra de estado
Plug 'vim-airline/vim-airline-themes'

" Esquemas de colores
Plug 'rafi/awesome-vim-colorschemes'

" Iconos para nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" tema muy oscuro
Plug 'bratpeki/truedark-vim'

" fin de plugins
call plug#end()

" --------------------
" ajustes tema
" --------------------

" Tema oscuro
set background=dark
set termguicolors
colorscheme truedark

" Definir path de Python
let g:python3_host_prog = 'C:/python38/python.exe'

" --------------------
" ajustes neovim
" --------------------

" plegar lineas largas (word wrap)
set wrap lbr

" resalta linea actual
set cursorline

" codificacion
set encoding=utf-8

" uso de mouse
set mouse=a

" regla relativa
set number relativenumber

" portapapeles
set clipboard+=unnamedplus

" esconde -- INSERTAR --
set noshowmode

" configuracion de splits
set splitbelow splitright

" verificacion sintaxis
syntax on

" indentacion automatica
set autoindent
set smartindent

" config tabs


" --------------------
" ajustes air-line
" --------------------

let g:airline_powerline_fonts = 1
let g:airline3extensions3tabline3enabled = 1

" --------------------
" ajustes de NERDTree
" --------------------

function! IsNERDTreeOpen()
	return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncTree()
	if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
		NERDTreeFind
		wincmd p
	endif
endfunction

autocmd BufEnter * call SyncTree()

" --------------------
"  ajustes coc
" --------------------
"
"  para autocompletar utilizando tab

inoremap <silent><expr> <TAB>
	\ pumvisible() ? coc#_select_confirm() :
	\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" --------------------
" ajustes rainbow_parentheses
" --------------------
augroup arcoiris
	autocmd!
	autocmd FileType c,ino,vhdl,py RainbowParentheses
augroup END

" --------------------
" Atajos de teclado
" --------------------

" tecla leader (espacio)
let mapleader = " "

" atajo salir
nmap <Leader>q :q<CR>

" atajo SALIR!
nmap <Leader>Q :q!<CR>

" atajo guardar
nmap <Leader>w :w<CR>

" atajo nerdtree
let NERDTreeQuitOnOpen=1
nmap <Leader>t :NERDTreeToggle<CR>

" atajos splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" movimiento por renglones
" en vez de por lineas
nnoremap j gj
nnoremap k gk

" sugeridos por ThePrimeagen
" en MUST HAVE VIM REMAPS

" yank desde puntero
nnoremap Y y$

" mantener centrado
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" breakpoits para deshacer
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ( (<c-g>u
inoremap [ [<c-g>u

" mover lineas
" en modo normal:
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
" en modo visual:
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" en modo insercion:
inoremap <C-j> :m .+1<CR>==
inoremap <C-k> :m .-2<CR>==
