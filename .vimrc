"@author:Equationzhao

set relativenumber
" syntax on
set autoindent
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set mouse=a
set encoding=utf-8
set hlsearch
filetype indent on
set cursorline
set showmatch
set wrap
set linebreak
set wrapmargin=2
set scrolloff=5
set laststatus=2
set incsearch
set spell spelllang=en_us
set autoread
set wildmenu
set wildmode=longest:list,full
set noeb
set confirm
set helplang=cn
set whichwrap+=<,>,h,l
set cmdheight=2
set ignorecase
set smartcase


inoremap jj <Esc>
noremap J 10j
noremap K 10k
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif


set laststatus=2

set statusline=\ @Equationzhao "
set statusline+=\ \|\|\ [FileName:\ %f]
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ [%l:%c]

" colorscheme one
" set background=dark
