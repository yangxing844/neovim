vim.o.confirm = true
vim.o.wrap = true
vim.o.ignorecase = true
vim.o.pastetoggle = "<f4>"
vim.o.wildignore = ".git,*.o,*.a,*.jpg,*.png,*.gif,*.pdf"
vim.opt.suffixes:append(".old")
vim.o.hidden = true
vim.o.undolevels = 100
vim.o.title = true
vim.o.history = 1000
vim.o.timeoutlen = 500
vim.opt.listchars:append("precedes:<,extends:>")
vim.o.backspace = "indent,eol,start"
vim.o.relativenumber = true
vim.o.number = true
vim.o.cindent = true
vim.o.copyindent = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.showmatch = true
vim.o.magic = true
vim.opt.clipboard:append("unnamedplus")
vim.o.fileformats = "unix,dos,mac"
vim.o.fileencodings = "utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1"
vim.o.enc = "utf-8"
vim.o.helplang = "en"
vim.o.showmode = false
vim.o.showcmd = true
vim.o.linebreak = true
vim.opt.path:append("/usr/share/asymptote")
vim.opt.suffixesadd:append(".asy")
-- vim.opt.isk:remove("_")
vim.o.binary = true
vim.o.eol = false
vim.o.textwidth = 120
vim.opt.cc:append("1")
vim.o.smartcase = true
vim.o.readonly = false
vim.o.scrolloff = 5
vim.o.conceallevel = 1
vim.o.colorcolumn = "120"
vim.o.undofile = true
vim.opt.autochdir = true
vim.opt.laststatus = 3
vim.opt.grepprg='rg'
-- use only filetype.lua to detect filetype
-- vim.g.do_filetype_lua = 1
-- vim.g.did_load_filetypes = 1

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

--Set colorscheme
vim.o.termguicolors = true
require("onedark").load()
-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
vim.opt.virtualedit  = block
vim.opt.listchars="eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
