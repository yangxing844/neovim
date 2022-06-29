
" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont FiraCode\ Nerd\ Font\ Mono:h16
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" Enable GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 0
endif

set guifont=FiraCode\ Nerd\ Font\ Mono:h16
set guifontwide=Noto\ Sans\ CJK:h16
let g:neovide_input_use_logo=v:true
let g:neovide_transparency=0.95
let g:neovide_cursor_animation_length=0
