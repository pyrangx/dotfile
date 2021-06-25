"auto install"
autocmd! VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugInstall --sync | q | endif
"======================================================================================================================"
"               												PLUGIN
"======================================================================================================================"
call plug#begin('~/.vim/plugged')
Plug    'dominikduda/vim_current_word'
Plug    'preservim/nerdcommenter'
Plug    'voldikss/vim-floaterm'
Plug    'Yggdroot/indentLine'
Plug    'mhinz/vim-startify'
Plug    'chrisbra/Colorizer'
Plug    'mhinz/vim-signify'
Plug    'neoclide/coc.nvim'
Plug    'junegunn/fzf.vim'
call plug#end()
"====================================================================================================================="
" 			               								   COCAutoload
"====================================================================================================================="
let g:coc_global_extensions = ['coc-json', 'coc-clangd']

