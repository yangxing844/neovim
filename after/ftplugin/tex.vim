let b:AutoPairs =  {'(':')', '[':']', '{':'}','"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''",'$':'$'} |
let b:loaded_matchparen=1
setlocal shiftwidth=2
"correct spell error on the fly
setlocal spell
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
