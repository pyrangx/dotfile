"leader is you must in first
let mapleader=","
"=============="
"   keymap   "
"=============="
"netrw"
nnoremap <silent> <C-e> :Vexplore<CR>
"redo
nnoremap <silent> U : redo<CR>
"coc snippts
imap <tab> <Plug>(coc-snippets-expand)
"complie
"autocmd FileType c nnoremap <leader>rr  :FloatermNew gcc % && ./a.out && rm a.out<CR>
autocmd FileType cpp  nnoremap <silent> <C-c> :FloatermNew --height=0.66 --width=0.36 --wintype=vertical --position=topright g++ % && ./a.out && rm a.out<CR>
"lazygit
nnoremap <silent> <leader>g :FloatermNew --height=0.9 --width=0.9 lazygit<CR>
"ranger
nnoremap <silent> <leader>n :FloatermNew --height=0.3 --width=0.99 --wintype=split --position=topleft ranger<CR>
"move window focuse
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>h <C-w>h
"the essentials
nnoremap <silent> <C-s> :update<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-j> :bn<CR>
nnoremap <silent> <C-k> :bp<CR>
"tabbar
nnoremap <silent> <S-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:tabprevious<CR>
nnoremap <silent> <tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:tabnext<CR>
"the newtab will open in horse page
autocmd BufEnter * if !exists('t:startified') | Startify | let t:startified = 1 | endif
"closeTAb
nnoremap <silent> <C-T> :tabnew [NewTab]<CR>
nnoremap <silent> <C-w> :BW<CR>
command! BW :bn|:bd#|tabclose
nnoremap <silent> <C-q> :BMW<CR>
command! BMW :bd
" Go to tab by number
noremap <A-1> 1gt
noremap <A-2> 2gt
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt
noremap <A-9> 9gt
noremap <A-0> :tablast<cr>
noremap <S-e> :set nomore <Bar> :ls <Bar> :set more <CR>:b<Space>
" use a different register for delete and paste
"nnoremap d "_d
"vnoremap d "_d
"vnoremap p "_dP
"nnoremap x "_x
"search
set hlsearch
let g:incsearch#auto_nohlsearch = 1
" new line in normal mode and back
map <Enter> o<ESC>

" emulate windows copy, cut behavior
vnoremap <LeftRelease> "+y<LeftRelease>
vnoremap <C-c> "+y<CR>
vnoremap <C-x> "+d<CR>
" disable hlghtlight for searching
noremap <silent><esc> <esc>:noh<CR><esc>
"" FZF
nnoremap <silent> <leader>f :Files ~<CR>
"  coc actions show details
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

"window move
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K
map sw :call WinBufSwap()<CR>
map <C-v> :set splitright<cr>:vsplit<cr>
map <C-h> :set splitbelow<cr>:split<cr>

map <left> :vertical resize+5<cr>
map <right> :vertical resize-5<cr>

"=================="
"    Coc keymap    "
"=================="

"find look up function
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
"coc enteruseful
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"coc tabuseful
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"?
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Symbol renaming.
nmap <leader>R <Plug>(coc-rename)
"show documentation in preview window.
nnoremap <silent> <c-d> :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
  endif
    execute '!' . &keywordprg .   ". expand('<cword>')"
endfunction
let g:coc_snippet_next = '<tab>'
" Move VISUAL LINE selection within buffer.
fun SwitchLine(src_line_idx, direction)
    if a:direction ==# 'up'
        if a:src_line_idx == 1
            return
        endif
        move-2
    elseif a:direction ==# 'down'
		if a:src_line_idx == line('$')
			return
		endif
        move+1
    endif
endf
nnoremap <silent> <s-k> :call SwitchLine(line('.'), 'up')<CR>
nnoremap <silent> <s-j> :call SwitchLine(line('.'), 'down')<CR>
nmap <s-R> <Plug>(coc-rename)
"windowMove
function! WinBufSwap()
  let thiswin = winnr()
  let thisbuf = bufnr("%")
  let lastwin = winnr("#")
  let lastbuf = winbufnr(lastwin)
  exec  lastwin . " wincmd w" ."|".
      \ "buffer ". thisbuf ."|".
      \ thiswin ." wincmd w" ."|".
      \ "buffer ". lastbuf
endfunction
command! Wswap :call WinBufSwap()
map sw :call WinBufSwap()<CR>
"set vb t_vb=
let s:hidden_all = 0
	function! ToggleHiddenAll()
			if s:hidden_all == 0
					let s:hidden_all = 1
					set noshowmode
					set noruler
					set laststatus=0
					set noshowcmd
					set cmdheight=1
			else
					let s:hidden_all = 0
					set showmode
					set ruler
					set laststatus=2
					set showcmd
					set cmdheight=2
			endif
		endfunction
		nnoremap <S-h> :call ToggleHiddenAll()
