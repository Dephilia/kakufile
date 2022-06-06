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

" Clear Additional Space
command! -nargs=0 ClearSpaces :%s/\s\+$//e
