"==============="
"    General    "
"==============="
let g:python3_host_prog = $GLOBALINSTALLDIR . "/usr/local/bin/python3"
set pumheight=10 "--------------------------------- limit autocomple candidates
set hidden "------------------------- if hidden is not set, TextEdit might fail.
set shortmess+=c "------------------- don't give |ins-completion-menu| messages.
set updatetime=300 "------------ smaller updatetime for CursorHold & CursorHoldI
"set cmdheight=1 "----------------------------------- better display for messages
"set signcolumn=no "------------------------------------ always show signcolumns
highlight SignColumn guibg=none ctermbg=none

" Some servers have issues with backup files, see #649
set nobackup | set nowritebackup
"==============="
"     Color     "
"==============="
hi CocErrorSign  ctermfg=90
hi CocWarningSign  ctermfg=138
hi CocInfoSign  ctermfg=65
hi CocHintSign  ctermfg=242
"coc color
highlight Pmenu ctermbg=251
highlight PmenuSel ctermbg=239 ctermfg=white
highlight PmenuSbar ctermbg=251
highlight PmenuThumb ctermbg=251

" Change these if you want
set updatetime=100
let g:signify_sign_add               = '⬆️'
let g:signify_sign_delete            = '⬇️'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '☑'
" I find the numbers disctracting
let g:signify_sign_show_count = 1
let g:signify_sign_show_text = 1

"If you like colors instead
highlight SignifySignAdd    ctermbg=none ctermfg=34
highlight SignifySignDelete ctermbg=none ctermfg=9
highlight SignifySignChange ctermfg=black ctermbg=yellow
highlight signifySignChange ctermbg=none ctermfg=172

"floaterm_autoclose_0_is_no
let g:floaterm_autoclose = 0

" floating window size ratio
let g:fzf_preview_floating_window_rate = 0.9

" fzf window position settings
let g:fzf_preview_direct_window_option = ''

augroup fzf_preview
  autocmd!
  autocmd User fzf_preview#rpc#initialized call s:fzf_preview_settings() " fzf_preview#remote#initialized or fzf_preview#coc#initialized
augroup END

function! s:fzf_preview_settings() abort
  let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
  let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
endfunction
