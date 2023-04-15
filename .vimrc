"@author:Equationzhao

set autowrite
set nocompatible
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
set updatetime=500

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
" "let g:rehash256 = 1
let mapleader = ","

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
nnoremap <c-g> :Rg<CR>
map <c-u> :TagbarToggle<CR>
map <c-j> :ter ++rows=20<CR>
let g:tagbar_autopreview = 1



if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" coc vim i
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-@> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" vim-go setup
"autocmd FileType go nmap <leader>r  <Plug>(go-run)
"autocmd FileType go nmap <leader>t  <Plug>(go-test)
"let g:go_test_timeout = '30s'
"function! s:build_go_files()
"      let l:file = expand('%')
"        if l:file =~# '^\f\+_test\.go$'
"            call go#test#Test(0, 1)
"                  elseif l:file =~# '^\f\+\.go$'
"                          call go#cmd#Build(0)
"                            endif
"endfunction
"let g:go_fmt_command = "goimports"
"autocmd FileType go nmap <leader>b :<C-u>call
"let g:go_highlight_types = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_generate_tags = 1
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_deadline = "5s"
"let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1
"autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
"autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0,'vsplit')
"autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
"autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0,'tabe')

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
let g:airline_theme='onedark'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeWinSize = 24
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'}}
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims=1

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
Plug 'sebdah/vim-delve'
Plug 'fatih/molokai'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'Raimondi/delimitMate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'github/copilot.vim'
Plug 'joshdick/onedark.vim'
Plug 'luochen1990/rainbow'
Plug 'preservim/nerdcommenter'
Plug 'skywind3000/vim-terminal-help'
call plug#end()


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark



