let b:AutoPairs =  {'(':')', '[':']', '{':'}','"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''",'$':'$'} |
let b:loaded_matchparen=1
setlocal shiftwidth=2
"correct spell error on the fly
setlocal spell
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

let g:vimtex_fold_types = {
      \ 'markers' : {'enabled': 1},
      \ 'comments' : {'enabled': 1},
      \ 'cmd_multi' : {'enabled': 1},
	  \ 'sections' : {'parse_levels': 1}
      \}
let g:vimtex_compiler_progname = 'nvr'
call vimtex#imaps#add_map({
      \ 'lhs' : 'i',
      \ 'rhs' : '\im',
	  \ 'wrapper' : 'vimtex#imaps#wrap_trivial',
      \ 'leader': ';'
      \})
call vimtex#imaps#add_map({
      \ 'lhs' : 'H',
	  \ 'rhs' : '\mathcal{H}',
	  \ 'wrapper' : 'vimtex#imaps#wrap_trivial',
      \ 'leader': ';'
      \})
