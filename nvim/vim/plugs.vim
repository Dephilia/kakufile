" Vim plug auto installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : has('win32') ? '~/vimfiles' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.fnamemodify(data_dir.'/autoload/plug.vim', ':p:S').' --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  set rtp+=data_dir.'/autoload'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet data_dir

call plug#begin()

" Interface
Plug 'nvim-lualine/lualine.nvim'
Plug 'kdheepak/tabline.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'kyazdani42/nvim-tree.lua', { 'on': 'NvimTreeToggle' }
Plug 'kyazdani42/nvim-web-devicons'

" Vim utils, motions
Plug 'phaazon/hop.nvim'        " Replacement for easymotion & sneak
Plug 'aperezdc/vim-template'   " Template for new file
Plug 'junegunn/vim-easy-align' " make code beautiful
Plug 'ahonn/vim-fileheader'    " insert the info at head
Plug 'airblade/vim-gitgutter'  " show git status
Plug 'itchyny/vim-gitbranch'   " Show git branch
Plug 'tpope/vim-commentary'    " use [gc] to comment everything
Plug 'psliwka/vim-smoothie'    " More smoooooooth
Plug 'godlygeek/tabular'       " align tool
Plug 'tpope/vim-surround'      " quote it
Plug 'luochen1990/rainbow'     " colorful brackets
Plug 'vim-scripts/DoxygenToolkit.vim'

" Syntax
Plug 'sheerun/vim-polyglot'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'liuchengxu/vista.vim'
Plug 'simrat39/symbols-outline.nvim'

" Completion Family
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'onsails/lspkind-nvim'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim' " Dependency for telescope
Plug 'nvim-telescope/telescope.nvim'

" Themes
Plug 'connorholyday/vim-snazzy'
Plug 'arcticicestudio/nord-vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" If I remember you (Due to some reasons, I give you up)
" These plugs are good, but I find better one
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'itchyny/lightline.vim'             " Yet another plugin for airline
" Plug 'mengelbrecht/lightline-bufferline' " Buffer for lightline
" Plug 'vim-airline/vim-airline'        " beautiful status bar
" Plug 'vim-airline/vim-airline-themes' " airline themes
" Plug 'ryanoasis/vim-devicons'         " give vim icons
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'majutsushi/tagbar',   { 'on': 'TagBarToggle' }
" Plug 'easymotion/vim-easymotion'         " move it!
" Plug 'justinmk/vim-sneak'                " move it sneaky!

call plug#end()
