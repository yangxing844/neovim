setlocal makeprg=asy\ %
setlocal errorformat=%f:\ %l.%c:\ %m
let b:AutoPairs =  {'(':')', '[':']', '{':'}','"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''",'$':'$'} |