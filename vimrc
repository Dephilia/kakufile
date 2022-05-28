" @Author: Dephilia <me@dephilia.moe>
" @Date: 2019-10-17 23:45:54
" @Last Modified by: Dephilia <me@dephilia.moe>
" @Last Modified time: 2022-05-28 15:54:48

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

" lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
function! Devicons_Filetype()"{{{
  " return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction"}}}
function! Devicons_Fileformat()"{{{
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction"}}}

let g:lightline#bufferline#number_separator = ''
let g:lightline#bufferline#show_number      = 2
let g:lightline#bufferline#unicode_symbols  = 1
let g:lightline#bufferline#enable_nerdfont  = 1
let g:lightline#bufferline#enable_devicons  = 1
let g:lightline#bufferline#unicode_symbols  = 1
let g:lightline#bufferline#icon_position    = 'right'
let g:lightline#bufferline#number_map       = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

let g:lightline = {
\   'colorscheme': 'snazzy',
\   'active': {
\     'left':[
\       [ 'mode', 'paste' ],
\       [ 'currentfunction', 'readonly', 'filename', 'modified' ]
\     ],
\     'right': [
\       [ 'gitbranch', 'devicons_filetype', 'lineinfo' ],
\       [ 'asyncrun_status', 'cocstatus' ],
\     ]
\   },
\   'component': {
\     'lineinfo': '%3p%%  %3l:%-2v',
\     'vim_logo': "\ue7c5",
\   },
\   'component_function': {
\     'cocstatus': 'coc#status',
\     'currentfunction': 'CocCurrentFunction',
\     'gitbranch': 'gitbranch#name',
\     'devicons_filetype': 'Devicons_Filetype',
\     'devicons_fileformat': 'Devicons_Fileformat',
\   },
\   'component_expand': {
\     'buffers': 'lightline#bufferline#buffers',
\     'asyncrun_status': 'lightline#asyncrun#status'
\   },
\   'component_type': {
\     'buffers': 'tabsel'
\   }
\}

let g:lightline.separator = {
\   'left': '', 'right': ''
\}

let g:lightline.subseparator = {
\   'left': '', 'right': ''
\}

let g:lightline.tabline = {
\   'left': [ [ 'vim_logo'], ['buffers'] ],
\   'right': [ ['close'], ['tabs'] ]
\}

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

map <silent> <Leader><C-r> :so $MYVIMRC <CR>

" Clear Additional Space
command! -nargs=0 ClearSpaces :%s/\s\+$//e

" copy to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Copymode -> Toggle hidden char to be visible
function! CopyModeEnable()
  set norelativenumber
  set nonumber
  set nolist
  call gitgutter#disable()
endfunction
command! -nargs=0 CopyModeEnable :call CopyModeEnable()

function! CopyModeDisable()
  set relativenumber
  set number
  set list listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
  call gitgutter#enable()
endfunction
command! -nargs=0 CopyModeDisable :call CopyModeDisable()

" Hex Modified
function! HexModeEnable()
  if !executable('xxd')
    echo "xxd not installed."
    return
  endif
  set ft=xxd
  set binary
  set noeol
  execute('%!xxd')
endfunction
command! -nargs=0 HexModeEnable :call HexModeEnable()

function! HexModeDisable()
  if !executable('xxd')
    echo "xxd not installed."
    return
  endif
  execute('%!xxd -r')
  set ft&
  set eol
endfunction
command! -nargs=0 HexModeDisable :call HexModeDisable()

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
"        COC       "
"++++++++++++++++++"


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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"++++++++++++++++++"
"       END        "
"++++++++++++++++++"
