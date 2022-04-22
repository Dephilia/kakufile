" @Author: Dephilia <me@dephilia.moe>
" @Date: 2019-10-17 23:45:54
" @Last Modified by: Chi-hao.Lee <Chi-hao.Lee@mediatek.com>
" @Last Modified time: 2022-04-22 09:28:57

"++++++++++++++++++"
"      Vars        "
"++++++++++++++++++"
let mapleader = ","

let g:SnazzyTransparent = 1

" airline setting
let g:airline_powerline_fonts                 = 1
let g:airline#extensions#tabline#enabled      = 1
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter    = 'default'
let g:airline_theme                           = 'base16_snazzy'

let g:rainbow_active          = 1
let g:python_highlight_all    = 1

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
Plug 'vim-airline/vim-airline'        " beautiful status bar
Plug 'vim-airline/vim-airline-themes' " airline themes
Plug 'ryanoasis/vim-devicons'         " give vim icons
Plug 'aperezdc/vim-template'          " Template for new file
Plug 'junegunn/vim-easy-align'        " make code beautiful
Plug 'ahonn/vim-fileheader'           " insert the info at head
Plug 'airblade/vim-gitgutter'         " show git status
Plug 'tpope/vim-commentary'           " use [gc] to comment everything
Plug 'psliwka/vim-smoothie'           " More smoooooooth
Plug 'godlygeek/tabular'              " align tool
Plug 'tpope/vim-surround'             " quote it
Plug 'easymotion/vim-easymotion'      " move it!
Plug 'luochen1990/rainbow'            " colorful brackets

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar',   { 'on': 'TagbarToggle' }

" **SYNTAX** "
Plug 'sheerun/vim-polyglot'             " many syntax
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp']}
Plug 'moll/vim-node',                    {'for': ['javascript']}
Plug 'timonv/vim-cargo',                 {'for': ['rust']}
Plug 'rust-lang/rust.vim',               {'for': ['rust']}

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
nmap <silent> <Leader>N :NERDTreeToggle<CR>
nmap <silent> <Leader>T :TagbarToggle<CR>

" tabline mapping
nmap <C-h> <Plug>AirlineSelectPrevTab
nmap <C-l> <Plug>AirlineSelectNextTab

" easy align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Auto add bracket
let s:AutoBracketEnable = 0

function! ToggleBracketMode()
    if s:AutoBracketEnable
        iunmap {
        iunmap {<Enter>
        iunmap (
        iunmap (<Enter>
        iunmap '
        iunmap "
        let s:AutoBracketEnable = 0
        echo "Disable Auto Bracket"
    else
        inoremap { {}<Left>
        inoremap {<Enter> {}<Left><CR><ESC><S-o>
        inoremap ( ()<ESC>i
        inoremap (<Enter> ()<Left><CR><ESC><S-o>
        inoremap ' ''<LEFT>
        inoremap " ""<LEFT>
        let s:AutoBracketEnable = 1
        echo "Enable Auto Bracket"
    endif
endfunction
nmap <silent> <Leader>B :call ToggleBracketMode() <CR>
imap <silent> <Leader>B :call ToggleBracketMode() <CR>

map <silent> <Leader><C-r> :source $MYVIMRC <CR>

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

" Enable backspace avaliable in Insert mode
set backspace=indent,eol,start

" Show hide chars
set list listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" Where is the ctags file
set tags=./tags,./TAGS,tags;~,TAGS;~

"++++++++++++++++++"
"     Neovide      "
"++++++++++++++++++"
set guifont=Mononoki\ NF:h14
let g:neovide_transparency=0.9
let g:neovide_cursor_vfx_mode="railgun"
"++++++++++++++++++"
"       END        "
"++++++++++++++++++"
