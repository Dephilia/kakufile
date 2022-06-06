" @Author: Dephilia <me@dephilia.moe>
" @Date: 2019-10-17 23:45:54
" @Last Modified by: Dephilia <me@dephilia.moe>
" @Last Modified time: 2022-06-06 22:00:06

" Pre Plug Configuration
" Description: Some settings need to be configured
"   before load it.
"=============================="
let mapleader = ","

let g:SnazzyTransparent        = 1
let g:rainbow_active           = 1

" Load Plug
" Description: vim-plug start end.
"=============================="
runtime vim/plugs.vim

" Post Configuration
"=============================="
runtime vim/utils.vim
runtime vim/cscfg.vim
runtime vim/dashboard.vim

" Lua configuration
lua << EOF
  require('treesitter')
  require('nvimtree')
  require('lualine-config')
  require('lsp/setup')
  require('lsp/nvim-cmp')
  require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
EOF

" Auto command
"=============================="
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" Key mapping
"=============================="
" jj escape
inoremap <silent> jj <ESC>

" use arrow key
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" Plug mapping
nmap <silent> <Leader>vv :Vista!!<CR>
nmap <silent> <Leader>t  :SymbolsOutline<CR>
nmap <silent> <Leader>n  :NvimTreeToggle<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ft <cmd>Telescope <cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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

" copy to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

nmap <leader>e <cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>
vmap <leader>e <cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>
omap <leader>e <cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>

" Vim settings
"=============================="
syntax      enable    " Enable syntax
colorscheme snazzy

set background=dark " background
set encoding=UTF-8  " coding
set expandtab       " <tab> as many <space>
set tabstop=2       " width of tab
set showtabline=2   " Tabline
set laststatus=2    " Statusbar
set noshowmode
set shiftwidth=2    " indent width
set softtabstop=2   " how many space insert after press tab
set cmdheight=2     " Higher cmd line
set autoindent      " auto indent next line
set smartindent     " smart indent
set incsearch       " inc search
set ignorecase      " ignore case
set hlsearch        " search high light
set relativenumber  " show relative line number
set number          " show line number
set cursorline      " highlight current line
set hidden          " Hide edited buffer
set termguicolors
hi CursorLine term=bold cterm=bold

" Enable backspace avaliable in Insert mode
set backspace=indent,eol,start

" Show hide chars
set list listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

" Where is the tags file for ctags
set tags=./tags,./TAGS,tags;~,TAGS;~

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" GUI Settings
"=============================="
set guifont=Mononoki\ Nerd\ Font\ mono:h14
let g:neovide_transparency=0.9
let g:neovide_cursor_vfx_mode="railgun"

" END
"=============================="
