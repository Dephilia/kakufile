" @Author: dephilia <leedaniel682@gmail.com>
" @Date: 2019-10-17 23:45:54
" @Last Modified by: Dephilia <me@dephilia.moe>
" @Last Modified time: 2021-02-06 23:48:15

"++++++++++++++++++"
"      Vars        "
"++++++++++++++++++"
let mapleader = ","

let g:SnazzyTransparent = 1

" airline setting
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter    = 'default'
let g:airline_theme                           = 'deus'

let g:rainbow_active = 1
let g:Tlist_Ctags_Cmd = '/usr/local/opt/ctags'
let g:python_highlight_all = 1
let g:go_template_autocreate = 0
let g:javascript_plugin_jsdoc = 1
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

"++++++++++++++++++"
"      Plug        "
"++++++++++++++++++"

" Vim plug auto installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

" **BASIC** "

Plug 'vim-airline/vim-airline'            " beautiful status bar
Plug 'vim-airline/vim-airline-themes'     " airline themes
Plug 'ryanoasis/vim-devicons'             " give vim icons
Plug 'aperezdc/vim-template'              " Template for new file
Plug 'junegunn/vim-easy-align'            " make code beautiful
Plug 'ahonn/vim-fileheader'               " insert the info at head
Plug 'airblade/vim-gitgutter'             " show git status
Plug 'tpope/vim-commentary'               " use [gc] to comment everything
Plug 'psliwka/vim-smoothie'
Plug 'godlygeek/tabular'                  " align tool
Plug 'tpope/vim-surround'                 " quote it
Plug 'easymotion/vim-easymotion'          " move it!
Plug 'luochen1990/rainbow'                " colorful brackets

Plug 'scrooloose/nerdtree' , { 'on':  'NERDTreeToggle' } " treeeee
Plug 'majutsushi/tagbar', {'on': 'TagBarToggle'}


" **Coding!** "
Plug 'ycm-core/YouCompleteMe', {'do': 'python install.py --all', 'on': [] }
command! YcmCompleter call plug#load('YouCompleteMe') | call youcompleteme#Enable() | YcmCompleter

" **SYNTAX** "

Plug 'sheerun/vim-polyglot'             " many syntax

Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp']}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go'}
Plug 'moll/vim-node', {'for': ['javascript']}
Plug 'timonv/vim-cargo', {'for': ['rust']}
Plug 'rust-lang/rust.vim', {'for': ['rust']}

" **THEME** "

Plug 'connorholyday/vim-snazzy'

call plug#end()


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
map  <C-n> :NERDTreeToggle<CR>
" map  <F2>  :AddFileHeader<CR>
" nmap <F8>  :TagbarToggle<CR>

" refresh nerdtree
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" tabline mapping
nmap <C-h> <Plug>AirlineSelectPrevTab
nmap <C-l> <Plug>AirlineSelectNextTab
" nmap <Leader>w :bwipe<CR> 

" easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" auto add bracket
" inoremap { {}<Left>
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap ( ()<ESC>i
" inoremap (<Enter> ()<Left><CR><ESC><S-o>
" inoremap ' ''<LEFT>
" inoremap " ""<LEFT>

" copy to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p


" Run code map
" autocmd Filetype sh     nnoremap <buffer> <C-b> :w<CR> :!sh % <CR>
" autocmd Filetype python nnoremap <buffer> <C-b> :w<CR> :!python % <CR>
" autocmd Filetype javascript nnoremap <buffer> <C-b> :w<CR> :!node % <CR>
" autocmd Filetype swift  nnoremap <buffer> <C-b> :w<CR> :!swift % <CR>
" autocmd Filetype go  nnoremap <buffer> <C-b> :w<CR> :GoRun <CR>
" autocmd Filetype cpp    nnoremap <buffer> <C-b> :w<CR> :!clang++ % -o /tmp/temp.out -std=c++17 && /tmp/temp.out && rm /tmp/temp.out <CR>
" autocmd Filetype c      nnoremap <buffer> <C-b> :w<CR> :!clang % -o /tmp/temp.out && /tmp/temp.out && rm /tmp/temp.out <CR>
" autocmd Filetype tex    nnoremap <buffer> <C-b> :w<CR> :!if [ -s %:r.pdf ] ; then /bin/rm %:r.pdf && pdflatex % ; else pdflatex % ; fi <CR> :!open %:r.pdf <CR> <CR>

"++++++++++++++++++"
"      MAIN        "
"++++++++++++++++++"

syntax      enable    " Enable syntax
colorscheme snazzy
filetype    indent on " indent length by filetype

set background=dark " background
set encoding=UTF-8  " coding
set t_Co=256        " 256 color
set nocompatible    " Unable vi<>vim
set expandtab       " <tab> as many <space>
set tabstop=2       " width of tab
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
hi CursorLine term=bold cterm=bold
" se  mouse+=a        " let mouse select

" Enable backspace avaliable in Insert mode
set backspace=indent,eol,start

" Indent Guide
set list listchars=tab:\:\ ,trail:·,extends:?,precedes:?,nbsp:×

"++++++++++++++++++"
"       END        "
"++++++++++++++++++"
