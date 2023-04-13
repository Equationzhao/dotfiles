"@author:Equationzhao

set relativenumber
set autoindent
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set mouse=a
set encoding=utf-8
set cursorline
set showmatch
set wrap
set linebreak
set wrapmargin=2
set scrolloff=5
set laststatus=2
set incsearch
set autoread
set wildmenu
set wildmode=longest:list,full
set noeb
set confirm
set helplang=cn
set whichwrap+=<,>,h,l
set ignorecase
set smartcase

inoremap jj <Esc>
noremap J 10j
noremap K 10k
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
noremap <c-b> :NERDTreeToggle<CR>
noremap <c-f> :NERDTreeFind<CR>
nmap ss <Plug>(easymotion-s2)
nnoremap <c-p> :Files<CR>
nnoremap <c-g> :Ag<CR>
nmap <c-u> :TagbarToggle<CR>


if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif


set laststatus=2
"set statusline=\ @Equationzhao "
"set statusline+=\ \|\|\ [FileName:\ %f]
"set statusline+=%=
"set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %p%%
"set statusline+=\ [%l:%c]

let g:airline_powerline_fonts = 1  
let g:airline#extensions#tabline#enabled = 1 
"let g:airline_theme='moloai'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'}}
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1


" colorscheme one
" set background=dark

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'


" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mhinz/vim-startify'
Plug 'ghifarit53/tokyonight-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tracyone/fzf-funky',{'on': 'FzfFunky'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/tagbar'
Plug 'morhetz/gruvbox'
" Plug 'fatih/vim-go', {'do':'GoUpdateBinaries'}
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
call plug#end()


