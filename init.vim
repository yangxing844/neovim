 " ___      ___ ___  _____ ______   ________  ________     
 " |\  \    /  /|\  \|\   _ \  _   \|\   __  \|\   ____\    
 " \ \  \  /  / | \  \ \  \\\__\ \  \ \  \|\  \ \  \___|    
  " \ \  \/  / / \ \  \ \  \\|__| \  \ \   _  _\ \  \       
 " __\ \    / /   \ \  \ \  \    \ \  \ \  \\  \\ \  \____  
" |\__\ \__/ /     \ \__\ \__\    \ \__\ \__\\ _\\ \_______\
" \|__|\|__|/       \|__|\|__|     \|__|\|__|\|__|\|_______|
"{{{1 Load plugins
call plug#begin('~/.vim/plugged')
"" vim-sensible {{{ "
Plug 'tpope/vim-sensible'
let mapleader="\<space>"
"" }}} vim-sensible "
" dracula {{{ "
Plug 'dracula/vim', { 'as': 'dracula' }
let g:dracula_underline = 0
" }}} dracula "
" vim-snippets {{{ "
Plug 'honza/vim-snippets'

" }}} vim-snippets "
"{{{2   Coc Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <silent><expr> <c-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<c-j>" :
      \ coc#refresh()
inoremap <expr><c-k> pumvisible() ? "\<C-p>" : "\<c-k>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
endif
let g:coc_global_extensions = [
  \ 'coc-eslint',
  \ ]
autocmd CursorHold * silent call CocActionAsync('highlight')
nmap <silent> gd :call CocActionAsync('jumpDefinition')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
"no longer jump to definition
nmap <silent> gr <Plug>(coc-references-used) 
nnoremap <silent>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
"}}}2
" vim-devicons {{{ "
Plug 'ryanoasis/vim-devicons'

" }}} vim-devicons "
" vim-gitgutter {{{ "
Plug 'airblade/vim-gitgutter'
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '*'
let g:gitgutter_sign_removed            = '-'
let g:gitgutter_sign_removed_first_line = '‾'
let g:gitgutter_sign_removed_above_and_below = '_¯'
let g:gitgutter_sign_modified_removed   = '~_'
" }}} vim-gitgutter "
" vim-commentary {{{ "
Plug 'tpope/vim-commentary'

" }}} Fold description "
" python-syntax-highlight {{{ "
Plug 'vim-python/python-syntax'
Plug 'numirias/semshi'
Plug 'chrisbra/Colorizer'
let g:semshi#always_update_all_highlights=1 "solve foramt color losing"
let g:semshi#excluded_hl_groups=['local','builtin']
let g:semshi#mark_selected_nodes=0
let g:semshi#no_default_builtin_highlight=0
let g:semshi#error_sign=0
let g:semshi#simplify_markup = 0
" }}} python-syntax-highlight "
" tabular {{{ "
Plug 'godlygeek/tabular'

" }}} tabular "
" vim-markdown {{{ "
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_conceal_code_blocks = 1
" }}} vim-markdown "
" statusline {{{ 
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly','cocstatus', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'GitStatus',
	  \	  'readonly':  'LightlineReadonly',
	  \   'cocstatus': 'coc#status'
	  \},
		\ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ }
function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction
function! GitStatus()
	let [a,m,r] = GitGutterGetHunkSummary()
	return printf('+%d ~%d -%d', a, m, r)
endfunction
"}}}
" asyncrun {{{ 
Plug 'skywind3000/asyncrun.vim'
" }}} asyncrun "
" tex-conceal {{{ 
" Plug 'KeitaNakamura/tex-conceal.vim',{'for':'tex'}
" let g:tex_conceal="abdgm"
" let g:tex_conceal_frac=1

" }}} tex-conceal "
" vimtex {{{ 
Plug 'lervag/vimtex',{'for':'tex'}
let g:tex_flavor='AMStex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_automatic = 0
let g:vimtex_quickfix_mode = 0
let g:vimtex_matchparen_enabled = 0
nnoremap <localleader>lt :call vimtex#fzf#run()<cr>
let g:vimtex_compiler_latexmk_engines = {
			\ '_'         : '-xelatex --shell-escape'
			\}
let g:tex_stylish = 1
let g:tex_isk='48-57,a-z,A-Z,192-255,:'
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
      \ 'markers' : {'enabled': 1},
	  \ 'sections' : {'parse_levels': 1}
      \}
" let g:vimtex_format_enabled = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_imaps_enabled=0
" let g:tex_fast = "bMpr"
" }}} vimtex "
" auto-save {{{ 
Plug '907th/vim-auto-save'
let g:auto_save = 1
let	g:auto_save_events=["CursorHold"]
" augroup ft_tex
" 	au!
" 	au FileType tex let b:auto_save = 0
" augroup END
" }}} auto-save "
" UltiSnips {{{ 
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
nnoremap <leader>es :UltiSnipsEdit!<cr>
let g:UltiSnipsEditSplit='vertical'
" }}} UltiSnips "
" fzf {{{ 
Plug 'junegunn/fzf', {
      \ 'dir': '~/.fzf',
      \ 'do': './install --all --no-update-rc',
      \}
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
let $FZF_DEFAULT_COMMAND="rg --files "
let g:fzf_layout = {'window': {'width': 0.8, 'height': 0.75} }
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'],
      \}

let g:fzf_mru_no_sort = 1
let g:fzf_mru_include = '\v' . join([
      \ '\.git/',
      \], '|')
" let g:fzf_mru_relative = 1
" let g:fzf_mru_include

let $FZF_DEFAULT_OPTS = '--reverse --inline-info'

function! s:nothing()
endfunction

augroup my_fzf_config
  autocmd!
  autocmd User FzfStatusLine call s:nothing()
  autocmd FileType fzf silent! tunmap <esc>
augroup END

command! -bang Zotero call fzf#run(fzf#wrap(
            \ 'zotero',
            \ { 'source':  'fd -t f -e pdf . ~/.local/zotero/',
            \   'sink':    'silent !zathura --fork',
            \   'options': '-m -d / --with-nth=-1' },
            \ <bang>0))

nnoremap <silent> <leader>oo       :call fzf#run(fzf#wrap({
      \ 'dir': FindRootDirectory(),
      \ 'options': [
      \   '-m',
      \   '--prompt', 'Files > '
      \ ],
      \}))<cr>
" }}} fzf "
" auto-pairs {{{ "
Plug 'jiangmiao/auto-pairs'
let g:AutoPairs={'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
" }}} "
" vim-matchup {{{ "
Plug 'andymass/vim-matchup'
let g:matchup_matchparen_offscreen = {'method': 'popup'}
let g:matchup_override_vimtex = 1
let g:matchup_matchparen_deferred = 1 " perf issue"
" }}} vim-matchup "
" vim-surround {{{ "
Plug 'tpope/vim-surround'
" }}} vim-surround "
" vim-git {{{ "
Plug 'tpope/vim-fugitive'
" }}} vim-git "
" c++ highlight {{{ "
Plug 'jackguo380/vim-lsp-cxx-highlight'
" c++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" }}} c++ highlight "
" java-Script {{{ "
Plug 'pangloss/vim-javascript'
" }}} java-Script "
call plug#end()
"}}}1
"{{{1 UI
colorscheme dracula
set guifont=Firacode\ Nerd\ Font\ Mono:h15:w53
set mouse=vn
" used to remove tilde in vim empty buffer
" hi NonText guifg=bg
" {{{2  function Foldtext
function! Foldtext()
  let level = repeat('-', min([v:foldlevel-1,3])) . '+'
  let title = substitute(getline(v:foldstart), '{\{3}\d\?\s*', '', '')
  let title = substitute(title, '^["#! ]\+', '', '')
  return printf('%-4s %-s...', level, title)
endfunction
set foldtext=Foldtext()
set foldcolumn=0
set fillchars=vert:│,fold:\ ,diff:⣿
"}}}2
"}}}1
"{{{1 performance
set nocursorline
set undolevels=100
set title
set history=100
set timeoutlen=500
" fcitx input method {{{
if has('unix')
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx5-remote")
   if s:input_status == 2  "2 代表英文"
      let g:input_toggle = 1
      let l:a = system("fcitx5-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx5-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx5-remote -o")
      let g:input_toggle = 0
   endif
endfunction

"set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()
autocmd InsertEnter * call Fcitx2zh()
endif

" }}} fcitx input method "
set foldmethod=marker
au VimLeave * set guicursor=a:hor1 " auto cmd to restore cursor"
autocmd FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o "disable auto commenting"
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
autocmd TermOpen * startinsert 
"}}}1
"{{{1keymapping
"dealing with wrapped lines
noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap() "{{{2
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction
"2}}}
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ gj
set nowrap
cnoremap w!! execute 'silent! write !SUDO_ASKPASS=`which qt4-ssh-askpass` sudo tee % >/dev/null' <bar> edit!
" Buffer navigation
nnoremap <silent> gb    :bnext<cr>
nnoremap <silent> gB    :bprevious<cr>
" Utility maps for repeatable quickly change/delete current word
nnoremap c*   *``cgn
nnoremap c#   *``cgN
nnoremap cg* g*``cgn
nnoremap cg# g*``cgN
nnoremap d*   *``dgn
nnoremap d#   *``dgN
nnoremap dg* g*``dgn
nnoremap dg# g*``dgN
nnoremap gV  `[V`]
nnoremap <silent> <C-d> :CocCommand explorer<CR>
"right now there is no need for format selected
nnoremap ff :call CocActionAsync('format')<CR> 
vnoremap ff <Plug>(coc-format-selected)
nnoremap <silent> <c-f> :FZF<CR>
nnoremap <silent>++ vip++<esc>
"if the last window is explorer quit the window
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
" remve blank in the end
nnoremap <F1> :call UltiSnips#RefreshSnippets() <CR>
nnoremap <silent> <leader>xv :source $MYVIMRC <CR>
nnoremap <silent> <leader>ev :edit $MYVIMRC <CR>
nnoremap U <C-r>
nnoremap Y y$
nnoremap <c-e> $
inoremap <C-e> <C-o>$
nnoremap <c-a> ^
inoremap <C-a> <C-o>^
vnoremap <c-e> $
vnoremap <c-a> ^
nnoremap <silent> `` :on<CR>
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <backspace> za
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>
"a much more universal way of rename
nnoremap <silent> <F2> <Plug>(coc-rename)
nnoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-p> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" inoremap <silent><nowait><expr> <C-p> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
" vnoremap <silent><nowait><expr> <C-p> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" vnoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
nmap ]e <Plug>(coc-diagnostic-next-error)
nmap ]a <Plug>(coc-diagnostic-next)
nmap [e <Plug>(coc-diagnostic-prev-error)
nmap [a <Plug>(coc-diagnostic-prev)
nnoremap <silent> <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
          exec "w"
          if &filetype == 'python'
                  if search("@profile")
                          exec "AsyncRun kernprof -l -v %"
                          exec "copen"
                          exec "wincmd p"
                  elseif search("set_trace()")
                          exec "!python3 %"
                  else
                          exec "AsyncRun -mode=term -rows=5 -raw -focus=0 python3 %"
				  endif
          endif
		  if &filetype == 'cpp'
			  exec "AsyncRun -mode=term -rows=5 -raw g++ -Wall -O2 -g  $(VIM_FILEPATH)  && ./a.out"
		  endif
endfunc
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap fig : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
" reverse by line number
nnoremap <leader>rv :g/^/m0<CR>
"}}}1
"{{{ misc
" set undofile	" keep an undo file (undo changes after closing)
set wildignore=.git,*.o,*.a,*.jpg,*.png,*.gif,*.pdf
set suffixes+=.old
set hidden
set sidescroll=5
set listchars+=precedes:<,extends:>
" make scroll nice
set backspace=indent,eol,start "任何时候都可以输入回车"
set backspace=2
set updatetime=300
set autoindent
set shortmess+=c
set nobackup
set nowritebackup
set noswapfile
set autochdir
set tabstop=4
set softtabstop=4
set copyindent
set shiftwidth=4
set showmatch
set hlsearch
set iskeyword+=-,_
set cindent
set autowrite
set clipboard=unnamedplus
set termguicolors
set scrolloff=5
set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileformat=unix
set noshowmode "get ride of -- INSERT -- in lightline"
set linebreak
set helplang=en
set showcmd
set conceallevel=3
