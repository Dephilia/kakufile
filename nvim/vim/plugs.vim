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
Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/dashboard-nvim'
Plug 'kyazdani42/nvim-tree.lua', { 'on': 'NvimTreeToggle' }
Plug 'majutsushi/tagbar',        { 'on': 'TagbarToggle' }

" Vim utils, motions
Plug 'aperezdc/vim-template'     " Template for new file
Plug 'junegunn/vim-easy-align'   " make code beautiful
Plug 'ahonn/vim-fileheader'      " insert the info at head
Plug 'airblade/vim-gitgutter'    " show git status
Plug 'tpope/vim-commentary'      " use [gc] to comment everything
Plug 'psliwka/vim-smoothie'      " More smoooooooth
Plug 'godlygeek/tabular'         " align tool
Plug 'tpope/vim-surround'        " quote it
Plug 'easymotion/vim-easymotion' " move it!
Plug 'justinmk/vim-sneak'        " move it sneaky!
Plug 'luochen1990/rainbow'       " colorful brackets
Plug 'itchyny/vim-gitbranch'     " Show git branch
Plug 'vim-scripts/DoxygenToolkit.vim'

" Syntax
Plug 'sheerun/vim-polyglot'              " many syntax
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['cpp']}
Plug 'moll/vim-node',                    {'for': ['javascript']}
Plug 'timonv/vim-cargo',                 {'for': ['rust']}
Plug 'rust-lang/rust.vim',               {'for': ['rust']}
Plug 'mattn/emmet-vim',                  {'for': ['html']}

" LSP
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Themes
Plug 'connorholyday/vim-snazzy'
Plug 'arcticicestudio/nord-vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()
