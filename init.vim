let mapleader="\<space>"
"{{{1 Load plugins
call plug#begin('~/.vim/plugged')
" dracula {{{ "
Plug 'dracula/vim', { 'as': 'dracula' }
let g:dracula_underline = 0
" }}} dracula "
"{{{2   language server protocol
Plug 'neovim/nvim-lspconfig'
"}}}2
" vim-devicons {{{ "
Plug 'ryanoasis/vim-devicons'

" }}} vim-devicons "
" vim-gitgutter {{{ "
Plug 'airblade/vim-gitgutter'
" }}} vim-gitgutter "
" vim-commentary {{{ "
Plug 'tpope/vim-commentary'
" }}} Fold description "
" python-syntax-highlight {{{ "
Plug 'vim-python/python-syntax'
Plug 'numirias/semshi'
let g:semshi#always_update_all_highlights=1 "solve format color losing"
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

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" }}} vim-markdown "
" statusline {{{ 
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly','cocstatus', 'filename', 'modified',] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
	  \	  'readonly':  'LightlineReadonly',
	  \   'cocstatus': 'coc#status'
	  \},
      \ }
function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction
"}}}
" asyncrun {{{ 
Plug 'skywind3000/asyncrun.vim'
" }}} asyncrun "
" vimtex {{{ 
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_automatic = 0
let g:vimtex_quickfix_mode = 0
let g:vimtex_matchparen_enabled=0
let g:vimtex_indent_enabled=0
let g:vimtex_imaps_leader=';'
nnoremap <localleader>lt :call vimtex#fzf#run()<cr>
let g:vimtex_compiler_latexmk_engines = {
			\ '_'         : '-pdflatex --shell-escape'
			\}
let g:tex_stylish = 1
let g:tex_isk='48-57,a-z,A-Z,192-255,:'
let g:vimtex_fold_enabled = 1
" }}} vimtex "
" auto-save {{{ 
Plug '907th/vim-auto-save'
let g:auto_save = 0
" }}} auto-save "
" UltiSnips {{{ 
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
nnoremap <leader>es :UltiSnipsEdit!<cr>
let g:UltiSnipsEditSplit='vertical'
let g:snips_author='yangxing'
" }}} UltiSnips "
" fzf {{{ 
Plug 'junegunn/fzf', {
      \ 'dir': '~/.fzf',
      \ 'do': './install --all --no-update-rc',
      \}
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
let $FZF_DEFAULT_COMMAND="rg --files"
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
" let g:AutoPairs={'{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''"}
" }}} "
" " vim-matchup {{{ "
Plug 'andymass/vim-matchup'
let g:matchup_matchparen_offscreen = {'method': 'popup'}
let g:matchup_override_vimtex = 1
let g:matchup_matchparen_deferred = 1 " perf issue"
let g:matchup_matchparen_deferred_show_delay = 150
" " }}} vim-matchup "
" vim-surround {{{ "
Plug 'tpope/vim-surround'
" }}} vim-surround "
" " vim-git {{{ "
" Plug 'tpope/vim-fugitive'
" " }}} vim-git "
" java-Script {{{ "
Plug 'pangloss/vim-javascript'
" }}} java-Script "
" Colorizer {{{ "
Plug 'chrisbra/Colorizer'
" }}} Colorizer "
" kmonad {{{ "
Plug 'https://github.com/kmonad/kmonad-vim.git'
" }}} kmonad "
" veiw register {{{ "
Plug 'junegunn/vim-peekaboo'
" }}} veiw register "
call plug#end()
"}}}1
"{{{1 UI
colorscheme dracula
au VimLeave * set guicursor=a:hor1 " auto cmd to restore cursor"
set mouse=vn
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
" fcitx input method {{{
" if has('unix')
" let g:input_toggle = 0
" function! Fcitx2en()
"    let s:input_status = system("fcitx5-remote")
"    if s:input_status == 2 
"       let g:input_toggle = 1
"       let l:a = system("fcitx5-remote -c")
"    endif
" endfunction

" function! Fcitx2zh()
"    let s:input_status = system("fcitx5-remote")
"    if s:input_status != 2 && g:input_toggle == 1
"       let l:a = system("fcitx5-remote -o")
"       let g:input_toggle = 0
"    endif
" endfunction

" autocmd InsertLeave * call Fcitx2en()
" autocmd InsertEnter * call Fcitx2zh()
" endif

" }}} fcitx input method "
autocmd! FileType * setlocal formatoptions -=c formatoptions -=r formatoptions -=o "disable auto commenting"
autocmd! BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
if has("nvim")
	autocmd! TermOpen * startinsert 
endif
autocmd! FileType help wincmd _
au BufRead,BufNewFile *.asy		set filetype=asy
"}}}1
"{{{1key-binding
command Fw :execute 'w !sudo tee >/dev/null %:p:S' | setl nomod
nnoremap <silent> <leader><leader> :CocCommand explorer<CR>
nnoremap <silent> <leader>b :Buffers<CR>
"right now there is no need for format selected
nnoremap <silent> <leader>f :FZF<CR>

nnoremap <F1> :call UltiSnips#RefreshSnippets() <CR>

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
" make count jump a tag

"moving text in group with J and K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"disable scrollwhell

nnoremap <silent><nowait><expr> <C-n> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-p> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"visual select and search string
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>


nmap ]e <Plug>(coc-diagnostic-next-error)
nmap ]a <Plug>(coc-diagnostic-next)
nmap [e <Plug>(coc-diagnostic-prev-error)
nmap [a <Plug>(coc-diagnostic-prev)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> <F3> :AutoSaveToggle<CR>

tnoremap <silent> <C-j> <C-\><C-n><C-w><C-j>a
tnoremap <Esc> <C-\><C-n>
tnoremap <silent> <C-k> <C-\><C-n><C-w><C-k>a

nnoremap <silent> <F5> :call CompileRunGcc()<CR>
lua << EOF
local normal_compile = "g++ % && ./a.out"
local make_compile = "make run"
local cmake_compile = "cmake build && make -C build run -s"
local cwd = vim.fn.expand("%:h")

local function file_exists(name)
	local f = io.open(name,'r')
	if f~=nil
		then io.close(f)
		return true
	else
		return false
	end
end

function _G.run_command()
	if file_exists(cwd.."/Makefile") then
		return make_compile
	elseif file_exists(cwd.."/CMakeLists.txt") then
		return cmake_compile
	else
		return normal_compile
	end
end
EOF
func! CompileRunGcc()
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
		  if &filetype == 'cpp' || &filetype == 'c' 
			  exec "AsyncRun -mode=term -rows=5 -raw -focus=0 " . v:lua.run_command()
		  endif
		  if &filetype == 'sh'
			  exec "AsyncRun -mode=term -rows=5 -raw %"
		  endif
endfunc
" reverse by line number
nnoremap <leader>rv :g/^/m0<CR>
if exists(":Tabularize")
      nnoremap <leader>a = :Tabularize / = <CR>
      nnoremap <leader>a = :Tabularize / = <CR>
      nnoremap <leader>a: :Tabularize /:\zs<CR>
      nnoremap <leader>a: :Tabularize /:\zs<CR>
endif
"}}}1
"{{{ misc

"fold comments 
" set foldmethod=expr foldexpr=getline(v:lnum)=~'^\\s*'.&commentstring[0]

" undodir in tmpfs
let s:undodir="/tmp/.undodir_".$USER
if !isdirectory(s:undodir)
	call mkdir(s:undodir,"",0700)
endif

let &undodir=s:undodir
set undofile

"no binary increase for numbers 
set nrformats=
"set python 3.10 path
let g:python3_host_prog = '/usr/bin/python'

"}}}
" highlight  {{{ "
hi Search guibg=NONE
hi Search guifg=yellow
hi NonText guibg=#212529
hi NonText guifg=#212529
" }}} highlight  "
" lua test {{{ "
lua require('compile_lua')
lua require('key-binding')
lua require('settings')
lua require('lsp-config')
" }}} lua test "
