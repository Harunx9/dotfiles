"initialize plugin in terminal neovim
if !exists('g:vscode') 
    call plug#begin('~/.config/nvim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    
    Plug 'tpope/vim-fugitive'
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
    Plug 'wakatime/vim-wakatime'
    Plug 'mhinz/vim-startify'
        
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
        
    Plug 'matze/vim-move'
    Plug 'easymotion/vim-easymotion'
    Plug 'luochen1990/rainbow'
    
    Plug 'vim-syntastic/syntastic'
    Plug 'sheerun/vim-polyglot'
    
    "RUST
    Plug 'rust-lang/rust.vim'
    Plug 'mhinz/vim-crates'
    
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
    
    Plug 'ryanoasis/vim-devicons'
    Plug 'arcticicestudio/nord-vim'
    Plug 'sainnhe/sonokai'
    Plug 'ayu-theme/ayu-vim'
    Plug 'gruvbox-community/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    Plug 'Yggdroot/indentLine'
    Plug 'rakr/vim-one'
    call plug#end()
endif
"Common settings
set path+=**
set wildmenu
set showcmd
set mouse=nv
syntax enable
filetype on
let mapleader = ','
"Save file
map <leader>w :w<cr>

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

set nohlsearch
set smartindent
set cursorline
set clipboard+=unnamedplus
set colorcolumn=80
set tabstop=4
set softtabstop=4 
set shiftwidth=4
set expandtab
set number
set laststatus=2
set number
set relativenumber 
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set incsearch
" NO SWAP FILE 
set noswapfile
set nobackup
set nowritebackup
set nowb
set noshowmode
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:24

set splitright
set splitbelow

if exists('g:vscode')
" THEME CHANGER

" THEME CHANGER
function! SetCursorLineNrColorInsert(mode)
    " Insert mode: blue
    if a:mode == "i"
        call VSCodeNotify('nvim-theme.insert')

    " Replace mode: red
    elseif a:mode == "r"
        call VSCodeNotify('nvim-theme.replace')
    endif
endfunction


function! SetCursorLineNrColorVisual()
    set updatetime=0
    call VSCodeNotify('nvim-theme.visual')
endfunction

vnoremap <silent> <expr> <SID>SetCursorLineNrColorVisual SetCursorLineNrColorVisual()
nnoremap <silent> <script> v v<SID>SetCursorLineNrColorVisual
nnoremap <silent> <script> V V<SID>SetCursorLineNrColorVisual
nnoremap <silent> <script> <C-v> <C-v><SID>SetCursorLineNrColorVisual

function! SetCursorLineNrColorVisual()
    set updatetime=0
    call VSCodeNotify('nvim-theme.visual')
endfunction

vnoremap <silent> <expr> <SID>SetCursorLineNrColorVisual SetCursorLineNrColorVisual()
nnoremap <silent> <script> v v<SID>SetCursorLineNrColorVisual
nnoremap <silent> <script> V V<SID>SetCursorLineNrColorVisual
nnoremap <silent> <script> <C-v> <C-v><SID>SetCursorLineNrColorVisual


augroup CursorLineNrColorSwap
    autocmd!
    autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
    autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
    autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
augroup END
    function! s:openVSCodeCommandsInVisualMode()
        normal! gv
        let visualmode = visualmode()
        if visualmode == "V"
            let startLine = line("v")
            let endLine = line(".")
            call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
        else
            let startPos = getpos("v")
            let endPos = getpos(".")
            call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
        endif
    endfunction

    "NAVIGATION
    nnoremap <c-j> <Cmd>call VSCodeNotify('workbench.action.navigateDown')<Cr>
    xnoremap <c-j> <Cmd>call VSCodeNotify('workbench.action.navigateDown')<Cr>

    nnoremap <c-k> <Cmd>call VSCodeNotify('workbench.action.navigateUp')<Cr>
    xnoremap <c-k> <Cmd>call VSCodeNotify('workbench.action.navigateUp')<Cr>

    nnoremap <c-l> <Cmd>call VSCodeNotify('workbench.action.navigateRight')<Cr>
    xnoremap <c-l> <Cmd>call VSCodeNotify('workbench.action.navigateRight')<Cr>

    nnoremap <c-h> <Cmd>call VSCodeNotify('workbench.action.navigateLeft')<Cr>
    xnoremap <c-h> <Cmd>call VSCodeNotify('workbench.action.navigateLeft')<Cr>

    xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>

    nmap <leader>ac  <Cmd> call VSCodeNotify('editor.action.quickFix')<Cr>
    nmap <silent>[g <cmd> call VSCodeNotify('editor.action.marker.prev')<cr>
    nmap <silent>]g <cmd> call VSCodeNotify('editor.action.marker.next')<cr>
    nmap <leader>rn <cmd> call VSCodeNotify('editor.action.rename')<cr>
    map <C-w> :tabclose<CR>
endif

if !exists('g:vscode')
    "Buffer switch 
    map <C-w> :bd<CR>
    map <leader>bn :bn<cr>
    map <leader>bp :bp<cr>
    map <leader>bd :bd<cr>
    "NAVIGATION 
    nnoremap <c-j> <c-w><c-j>
    nnoremap <c-k> <c-w><c-k>
    nnoremap <c-l> <c-w><c-l>
    nnoremap <c-h> <c-w><c-h>
    "Colortheme
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    set termguicolors
    
    set background=dark
    " NORD
    "let g:nord_italic = 1
    "let g:nord_italic_comments = 1
    
    " Sonokai
    "let g:sonokai_style = 'atlantis'
    "let g:sonokai_enable_italic = 1
    "colorscheme sonokai
    
    "AYU
    "let ayucolor="mirage"
    "colorscheme ayu

    "GRuvbox
    "colorscheme gruvbox
    "let g:gruvbox_italic_term =1
    "let g:gruvbox_contrast_dark='hard'
    "let g:gruvbox_contrast_light='hard'
    "let g:gruvbox_invert_indent_guides = 1
    "let g:gruvbox_improved_warnings = 1
    "let g:gruvbox_improved_strings = 1

    "Gruvbox material
    let g:gruvbox_material_background = 'hard'
    let g:gruvbox_material_enable_italic = 1
    colorscheme gruvbox-material
    
    "ONE
    "colorscheme one
    "let g:one_allow_italics=1
    
    let g:indentLine_char = ''
    let g:indentLine_first_char = ''
    let g:indentLine_showFirstIndentLevel = 1
    let g:indentLine_setColors = 0

    noremap <leader><leader> :b#<CR>
    "####################################
    "Tagnbar
    nmap <F8> :TagbarToggle<CR>
    
    "############ FZF ###################
    let g:fzf_action = {
          \ 'ctrl-s': 'split',
          \ 'ctrl-v': 'vsplit'
          \ }
    let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'
    let g:fzf_nvim_statusline = 0
    let g:fzf_layout = { 'window' : {'width' : 0.8, 'height':0.8 }}
    nnoremap <C-p> :Files<cr>
    nnoremap <space>b :Buffers<CR>
    augroup fzf
      autocmd!
      autocmd! FileType fzf
      autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
    augroup END
    "###################################
    
    " ############### AIRLINE ############
    let g:airline_theme='gruvbox_material'
    "let g:airline_theme='ayu'
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
    let g:airline_left_alt_sep = ''
    let g:airline_right_alt_sep = ''
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
    	autocmd FileType typescript,json,rust setl formatexpr=CocAction('formatSelected')
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
    
    " #################### Vim crates ##################
    if has('nvim')
      autocmd BufRead Cargo.toml call crates#toggle()
    endif
    " ##################################################
    
    " Rainbow brackets
    let g:rainbow_active = 1
endif
