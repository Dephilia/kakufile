let g:dashboard_custom_header =<< trim END
 ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
 ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
 ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
 ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
 ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
 ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝
    -- Neovim of Dephilia
END
" Generate ascii art here
" https://lachlanarthur.github.io/Braille-ASCII-Art/
let g:dashboard_custom_shortcut={
\ 'last_session'       : '<leader> s l',
\ 'find_history'       : '<leader> f h',
\ 'find_file'          : '<leader> f f',
\ 'new_file'           : '<leader> c n',
\ 'change_colorscheme' : '<leader> t c',
\ 'find_word'          : '<leader> f a',
\ 'book_marks'         : '<leader> f b',
\ }
let g:dashboard_default_executive ='telescope'
autocmd FileType dashboard nmap <buffer> <Leader>ss :<C-u>SessionSave<CR>
autocmd FileType dashboard nmap <buffer> <Leader>sl :<C-u>SessionLoad<CR>
autocmd FileType dashboard nnoremap <buffer> <silent> <Leader>fh :DashboardFindHistory<CR>
autocmd FileType dashboard nnoremap <buffer> <silent> <Leader>ff :DashboardFindFile<CR>
autocmd FileType dashboard nnoremap <buffer> <silent> <Leader>tc :DashboardChangeColorscheme<CR>
autocmd FileType dashboard nnoremap <buffer> <silent> <Leader>fa :DashboardFindWord<CR>
autocmd FileType dashboard nnoremap <buffer> <silent> <Leader>fb :DashboardJumpMark<CR>
autocmd FileType dashboard nnoremap <buffer> <silent> <Leader>cn :DashboardNewFile<CR>
" hide tilde
autocmd FileType dashboard setlocal fillchars+=eob:\ 

