" @Author: Dephilia <me@dephilia.moe>
" @Date: 2019-10-17 23:45:54
" @Last Modified by: Dephilia <me@dephilia.moe>
" @Last Modified time: 2022-05-30 22:48:51

"++++++++++++++++++"
"      Vars        "
"++++++++++++++++++"
let mapleader = ","

let g:SnazzyTransparent    = 1
let g:rainbow_active       = 1
let g:python_highlight_all = 1

let g:coc_global_extensions = [
\   'coc-json',
\   'coc-clangd',
\   'coc-python',
\   'coc-dictionary',
\   'coc-tag',
\   ]
let g:dashboard_default_executive ='fzf'

"++++++++++++++++++"
"      Plug        "
"++++++++++++++++++"

" Vim plug auto installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet data_dir

call plug#begin()

" **BASIC** "
Plug 'itchyny/lightline.vim'             " Yet another plugin for airline
Plug 'mengelbrecht/lightline-bufferline' " Buffer for lightline
Plug 'ryanoasis/vim-devicons'            " give vim icons
Plug 'aperezdc/vim-template'             " Template for new file
Plug 'junegunn/vim-easy-align'           " make code beautiful
Plug 'ahonn/vim-fileheader'              " insert the info at head
Plug 'airblade/vim-gitgutter'            " show git status
Plug 'tpope/vim-commentary'              " use [gc] to comment everything
Plug 'psliwka/vim-smoothie'              " More smoooooooth
Plug 'godlygeek/tabular'                 " align tool
Plug 'tpope/vim-surround'                " quote it
Plug 'easymotion/vim-easymotion'         " move it!
Plug 'justinmk/vim-sneak'                " move it sneaky!
Plug 'luochen1990/rainbow'               " colorful brackets
Plug 'itchyny/vim-gitbranch'             " Show git branch
Plug 'vim-scripts/DoxygenToolkit.vim'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar',   { 'on': 'TagbarToggle' }

" **SYNTAX** "
Plug 'sheerun/vim-polyglot'             " many syntax
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp']}
Plug 'moll/vim-node',                    {'for': ['javascript']}
Plug 'timonv/vim-cargo',                 {'for': ['rust']}
Plug 'rust-lang/rust.vim',               {'for': ['rust']}

" nvim only plugin
if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter'
endif
Plug 'glepnir/dashboard-nvim'

" **LSP** "
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" html
Plug 'mattn/emmet-vim', {'for': ['html']}

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" **THEME** "
Plug 'connorholyday/vim-snazzy'
Plug 'arcticicestudio/nord-vim'

call plug#end()

"++++++++++++++++++"
"       PLUG       "
"++++++++++++++++++"
" NERDTree
nmap <silent> <Leader>n :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
" Close NERDTree if only itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"++++++++++++++++++"
"       MAP        "
"++++++++++++++++++"

" jj escape
inoremap <silent> jj <ESC>

" use arrow key
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Plug mapping
nmap <silent> <Leader>t :TagbarToggle<CR>

" tabline mapping
nmap <silent> <C-h> :bprevious<CR>
nmap <silent> <C-l> :bnext<CR>
nmap <silent> <leader><C-h> :tabprevious<CR>
nmap <silent> <leader><C-l> :tabnext<CR>

" Buffer mapping
" 1. List buffer
nnoremap <silent> bl :ls<CR>
" 2. New empty buffer
nnoremap <silent> bo :enew<CR>
" 3. Next buffer
nnoremap <silent> bn :bnext<CR>
" 4. Previous buffer
nnoremap <silent> bp :bprevious<CR>
" 5. Close buffer
nnoremap <silent> bd :bdelete<CR>

" easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

map <silent> <Leader><C-r> :so $MYVIMRC <CR>

" Clear Additional Space
command! -nargs=0 ClearSpaces :%s/\s\+$//e

" copy to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

"++++++++++++++++++"
"      MAIN        "
"++++++++++++++++++"

syntax      enable    " Enable syntax
colorscheme snazzy
filetype    indent on " indent length by filetype

set background=dark " background
set encoding=UTF-8  " coding
set expandtab       " <tab> as many <space>
set tabstop=2       " width of tab
set showtabline=2   " Tabline
set laststatus=2    " Statusbar
set noshowmode
set shiftwidth=2    " indent width
set softtabstop=2   " how many space insert after press tab
set autoindent      " auto indent next line
set smartindent     " smart indent
set incsearch       " inc search
set ignorecase      " ignore case
set hlsearch        " search high light
set relativenumber  " show relative line number
set number          " show line number
set cursorline      " highlight current line
set hidden          " Hide edited buffer
hi CursorLine term=bold cterm=bold

" Enable backspace avaliable in Insert mode
set backspace=indent,eol,start

" Show hide chars
set list listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" Where is the tags file for ctags
set tags=./tags,./TAGS,tags;~,TAGS;~

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


"++++++++++++++++++"
"     Neovide      "
"++++++++++++++++++"
set guifont=Mononoki\ Nerd\ Font\ mono:h14
let g:neovide_transparency=0.9
let g:neovide_cursor_vfx_mode="railgun"

"++++++++++++++++++"
"      cscope      "
"++++++++++++++++++"
" Remember to run `cscope -Rbqk` First
set cscopetag
set csto=0

if filereadable("cscope.out")
  cs add cscope.out
elseif $CSCOPE_DB != ""
  cs add $CSCOPE_DB
endif
set cscopeverbose

nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>

"++++++++++++++++++"
"     Include      "
"++++++++++++++++++"

runtime utils.vim
runtime lightline.vim
runtime coc.vim

"++++++++++++++++++"
"       END        "
"++++++++++++++++++"
