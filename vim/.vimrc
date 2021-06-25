"==========="
"   doc   "
"==========="

set ai													"so pi
set nowrap												"noAutoChangeLine
set wildmenu											"wildmenu
set tabstop=4											"tab
set scrolloff=6
set backspace=2											"backspace
set laststatus=2
set shiftwidth=4										"GanG
set ignorecase											"sameBiigandSmall
set smartindent											"smartsogin
set guifont=Monofur_for_Powerline:h17					"font
let g:NERDSpaceDelims=1
filetype plugin on
hi EndOfBuffer guifg=bg
"transparency
let g:transparency_ctermbg_none = 0
let g:transparency_config = {
      \  'active'   : 98,
      \  'inactive' : 80
      \ }

"=============="
"   keymap   "
"=============="

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map <space>j <C-w>j
map <space>k <C-w>k
map <space>l <C-w>l
map <space>h <C-w>h

map <c-p> "+p
vnoremap <c-c> "+y
map <silent> qq :q! <cr>
map <silent> wq :wq <cr>
map ss :update<cr>
map! '' <Esc> 
map <leader>l :SClose<CR>
map <silent> tt :NERDTreeToggle<Enter>


map <up> :res +5<cr>
map <down> :res -5<cr>
map <left> :vertical resize+5<cr>
map <right> :vertical resize-5<cr>

map sn :set splitright<cr>:vsplit<cr>
map sp :set splitbelow<cr>:split<cr>
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
let mapleader=" "
"?
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
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
"floatterm
map <leader>mm :FloatermNew --position=topright vifm<cr>

"============"
"   lang   "
"============"

setglobal fileencoding=-utf8
set encoding=utf-8
set nocompatible
"=============="
"    menu    "
"=============="
"256color
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set termguicolors
set signcolumn=number									"onelineshowall
set lines=33 columns=93
set guioptions=R										"noRoll
set noshowmode											"noshowmode
set bg=dark
set hidden												"no save can jupto other window
set vb
colorscheme oceanicnext

	let g:startify_custom_header = [					
\"  																						",
\"                                                                  -=._ 				",
\"                                                              .oo0P~GPjo. 				",
\"                                                         .o0o0000P'.?P   `jo.'.  		",
\"                                                  __     .000000P.;'   .dP.dPo) ,  	",
\"                                             . '0000oo.00d00b.P'        X^V  P<< 		",
\"                                               '~~',`0.d'd;V'.8      '(       o)K 		",
\"                         . -  ~  ~  -  .   _  _ - '  .d'd(   8'     ' :    @ .' X 		",
\"          _.oo00oo._ . `                             V' `?   ?'  .'   ;    .' 	 		",
\"       .C000000000000o=K                             '   `  `   `.   {  .  ; 			",
\"      C00000000000P~'   '             `                          )-.  `'J o, 			",
\"      `?000000P~' `     '              '                         ;. `.   `' 			",
\"        )0000D'   `      `            .'                       .'_.`-.`. 				",
\"    .oo00000P'     `.'`.  `.                           `.    .'       ) `. 			",
\"  .o00P~~'  .   - '  . - . _`(      .'` `  -  .  -  ` - -`.  ' _ .-   '`. , 			",
\"    ~j   .'         '   _          .'                      `'~     ' ' /'-, 			",
\"        . .' ' '  ' `  `  `~'`~--~'                              .' '  `-., 			",
\"        , ,          ` `                                      .',. ' 					",
\"        . .           ` `                                     U,'  					",
\"      . '.'         _ .`.` 															",
\"    ,-,'           bd_.' 																",
\"    U,' 																				",
\"  																						",
\]
   	
"============"
"  syntax  "
"============"

syntax on											"markDown
"cursor color
hi Cursor   guibg=#ff0087  guifg=#ffafff 
"mouseshinespeed
autocmd VimEnter * set guicursor=n:blinkwait0-blinkon0-blinkoff0
"cursor type
autocmd VimEnter * set guicursor=a:hor20-Cursor 
autocmd VimEnter * set guicursor=i:ver25-iCursor
" The word under cursor:
let g:vim_current_word#highlight_current_word = 1
let g:vim_current_word#enabled = 1
hi CurrentWord   guifg=#ffafff gui=underline
hi CurrentWordTwins  guifg=NONE gui=underline
hi cursorline gui = bold guibg =  bg
hi cursorline cterm = bold ctermbg = none
"in the terminal
hi CurrentWord cterm = none ctermfg=213
hi CurrentWordTwins cterm = underline ctermfg=none
"terminal cursor type
 "Mode Settings
 let &t_SI.="\e[5 q" "SI = INSERT mode
 let &t_SR.="\e[4 q" "SR = REPLACE mode
 let &t_EI.="\e[3 q" "EI = NORMAL mode (ELSE)
  "Cursor settings:
  "  1 -> blinking block
  "  2 -> solid block
  "  3 -> blinking underscore
  "  4 -> solid underscore
  "  5 -> blinking vertical bar
  "  6 -> solid vertical bar

"============="
"   tutor   "
"============="

set nu												"lineNumber
set cursorline
set relativenumber									"startinhere
" Airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"airline symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'

"floatterminal
let g:floaterm_keymap_new = '<space>n'
"airline themes
let g:airline_theme='fruit_punch'
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop = 1
let g:airline#extensions#tabline#enabled = 1
" Twins of word under cursor:
let g:vim_current_word#highlight_twins = 1
"time
"let g:airline_section_a = '%{strftime("%H:%M")}'
"NERDTree
let NERDTreeShowHidden=1
let g:NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers=1
let g:NERDTreeWinPos = "right"
let g:startify_bookmarks = systemlist("cut -sd' ' -f 2 ~/.NERDTreeBookmarks")
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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

"======================================================================================================================"
"												PLUGIN	
"======================================================================================================================"
call plug#begin('~/.vim/plugged')
Plug	'vim-airline/vim-airline-themes' 																	"airline-themes																	"airlinetTeme
Plug 	'vim-scripts/auto-pairs-gentle'
Plug 	'tsuyoshicho/transparency.vim'
Plug 	'dominikduda/vim_current_word'
Plug	'vim-airline/vim-airline'																			"airline
Plug	'preservim/nerdcommenter'
Plug  	'voldikss/vim-floaterm'
Plug 	'vim-scripts/zoom.vim' 
Plug 	'Yggdroot/indentLine'
Plug	'preservim/nerdtree'																				"nerdtree
Plug	'mhinz/vim-startify'																				"startify
Plug 	'tpope/vim-fugitive'
Plug	'honza/vim-snippets'
Plug	'neoclide/coc.nvim'  
Plug	'vim-scripts/c.vim'
Plug 	'powerline/fonts'
call plug#end()
"====================================================================================================================="
" 											   COCAutoload
"====================================================================================================================="
let g:coc_global_extensions = ['coc-json', 'coc-clangd', 'coc-vimlsp', 'coc-highlight']
