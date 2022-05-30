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

