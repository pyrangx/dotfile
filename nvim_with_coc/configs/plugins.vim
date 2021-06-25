"============="
"     FZF     "
"============="
" fzf settings
let g:fzf_action = {
            \ 'ctrl-x': 'split',
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'up': '~100%' }


" Enable per-command history.
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'"

"preview
let g:fzf_preview_window = 'right:50%'

"============"
"    Git     "
"============"
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

"floater
hi Floaterm ctermbg=250 ctermfg=blue
hi FloatermBorder ctermbg=224 ctermfg=21
let g:floaterm_gitcommit='floaterm'
let g:floaterm_borderchars = ""
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_title= "🍻 Welcome!"
let g:floaterm_autoclose=0
"let g:floaterm_opener = 'tabe'
let g:floaterm_opener = 'vsplit'

"brffer switcher
nnoremap S :SwitchBuffer <cr>
set switchbuf=usetab
let g:switch_buffer_hide_numbers = 1

"netrw"
let g:netrw_banner = 0
let g:netrw_liststyle= 3
let g:netrw_browse_split = 3
let g:netrw_winsize = 15
