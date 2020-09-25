" Many things taken from https://vimawesome.com/plugin/coc-nvim
set hidden
set nocompatible              " be iMproved, required
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set statusline^=%{coc#status()}
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

filetype off                  " required

" Vundle
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/ctrlp.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'sheerun/vim-polyglot'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'ajh17/vimcompletesme'
Plugin 'neoclide/coc.nvim', { 'branch': 'release' }
Plugin 'flazz/vim-colorschemes'
Plugin 'ddrscott/vim-side-search'


call vundle#end()            " required
filetype plugin indent on    " required

"
" NVIM Stuff
"

" COC
let g:coc_disable_startup_warning = 1


"
" Misc Settings
"
let mapleader = ","
set relativenumber

" git
nnoremap <leader>gd :Gdiffsplit<CR>

" remove highlighting
nnoremap <Leader>c :noh<CR>

" save
inoremap <Leader>w <Esc>:w<cr>a
nnoremap <Leader>w :w<cr>

"
" Syntax
"
syntax on
filetype plugin on
colorscheme bubblegum-256-dark
let g:vue_pre_processors = ['pug', 'scss']
let g:python_highlight_all = 1
set termguicolors
set showmatch
set ts=2
set sts=2
set sw=2
set autoindent
set smartindent
set smarttab
set expandtab

"
" Nerd Tree
"

" Start automatically when given no files to open
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeShowHidden=1
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>u :NERDTree %<CR>

"
" VimCompletesMe
"

"autocmd FileType vim let b:vcm_tab_complete = 'vim'
"let g:vcm_tab_complete=1

"
" CTRLP
"

let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = '\v[\/]\.?(tox|git|node_modules|venv)$'
let g:ctrlp_max_files=0

"
" SideSearch
"

let g:side_search_prg = 'ag --word-regexp --heading --stats'
  \. " --ignore='node_modules' --ignore='*.swp' --ignore='*.map.js' --ignore='*.min.js' --ignore='*static*'"
let g:side_search_splitter = 'vnew'

nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p

command! -complete=file -nargs=+ SS execute "SideSearch <args>"
