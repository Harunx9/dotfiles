call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'wakatime/vim-wakatime'
Plug 'mhinz/vim-startify'
Plug 'majutsushi/tagbar'
Plug 'junegunn/rainbow_parentheses.vim'
    
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    
Plug 'matze/vim-move'
Plug 'easymotion/vim-easymotion'

Plug 'vim-syntastic/syntastic'
Plug 'sheerun/vim-polyglot'

"RUST
Plug 'rust-lang/rust.vim'
Plug 'mhinz/vim-crates'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

Plug 'NLKNguyen/papercolor-theme'
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/sonokai'
call plug#end()

"######  Base settings ############
set path+=**
set wildmenu
set showcmd
set mouse=nv
syntax enable
filetype on
let mapleader = ','
"Save file
map <leader>w :w<cr>
"Buffer switch 
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>
map <leader>bd :bd<cr>
" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
set termguicolors

set background=dark
" NORD
"let g:nord_italic = 1
"let g:nord_italic_comments = 1

" Sonokai
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

colorscheme sonokai

set cursorline
set clipboard=unnamed
set colorcolumn=100
set tabstop=4
set softtabstop=0 
set shiftwidth=4
set expandtab
set number
set laststatus=2
set number
set relativenumber 
noremap <leader><leader> :b#<CR>
"####################################

"Tagnbar
nmap <F8> :TagbarToggle<CR>

" ########## NO SWAP FILE ###########
set noswapfile
set nobackup
set nowb
set noshowmode
" ###################################

"############SPLIT NAVIGATION ##########
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

set splitright
set splitbelow
"######################################

"############ FZF ###################
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_nvim_statusline = 0
let g:fzf_layout = { 'window' : {'width' : 0.8, 'height':0.8 }}
nnoremap <C-p> :Files<cr>
nnoremap <space>z :Buffers<CR>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
"###################################

" ############### AIRLINE ############
let g:airline_theme='sonokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_mode_map = {
			\ '__'     : '<->',
			\ 'c'      : '<C>',
			\ 'i'      : '<I>',
			\ 'ic'     : '<I>',
			\ 'ix'     : '<I>',
			\ 'n'      : '<N>',
			\ 'multi'  : '<M>',
			\ 'ni'     : '<N>',
			\ 'no'     : '<N>',
			\ 'R'      : '<R>',
			\ 'Rv'     : '<R>',
			\ 's'      : '<S>',
			\ 'S'      : '<S>',
			\ ''     : '<S>',
			\ 't'      : '<T>',
			\ 'v'      : '<V>',
			\ 'V'      : '<VL>',
			\ ''     : '<VB>',
			\ }

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.dirty=''

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
" ####################################

" ############### VIM MOVE ###########
let g:move_key_modifier = 'A'
"#####################################

"############### COC #########################
" if hidden is not set, TextEdit might fail.
set hidden

" " Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" " Better display for messages
set cmdheight=2

" " You will have bad experience for diagnostic messages when it's default
" 4000.
set updatetime=300

" " don't give |ins-completion-menu| messages.
set shortmess+=c

" " always show signcolumns
set signcolumn=yes

" use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction-line)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>
nnoremap <silent> <space>a  :<C-u>CocFzfList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocFzfList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocFzfList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocFzfList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocFzfList symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocFzfListListResume<CR>
nmap <C-n> :CocCommand explorer<CR>

"######################## Vim which key ####################
nnoremap <silent> <leader> :WhichKey ','<CR>

"################### Rainbow brackets #########################
let g:rainbow#pairs = [["<",">"], ['(', ')'], ['[',']'], ['{', '}']]
augroup rainbow_brackets
    autocmd!
    autocmd FileType rust,vim,cpp,javascript,json RainbowParentheses
augroup END

" #################### Vim crates ##################
if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif
" ##################################################
