setlocal textwidth=79
let g:python_highlight_all = 1
function	MycustonHighlight()
	hi semshiLocal           ctermfg=209 guifg=#ff875f
	hi semshiGlobal          ctermfg=141 guifg=#db93f9
	hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
	hi semshiParameter       ctermfg=75  guifg=#5fafff
	hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
	hi semshiFree            ctermfg=218 guifg=#ffafd7
	hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
	hi semshiAttribute       ctermfg=117  guifg=#9be9fd
	hi semshiSelf            ctermfg=249 guifg=#b2b2b2
	hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
	hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
	hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
	hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
endfunction
call MycustonHighlight()
setlocal foldmethod=indent
setlocal foldlevel=99
