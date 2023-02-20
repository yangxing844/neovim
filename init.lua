local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
require("lazy").setup("plugins", {
	defaults = {
		lazy = false, -- should plugins be lazy-loaded?
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = false,
		notify = true, -- get a notification when changes are found
	},
	disabled_plugins = {
		"gzip",
		"matchit",
		"matchparen",
		"netrwPlugin",
		"tarPlugin",
		"tohtml",
		"tutor",
		"zipPlugin",
	},
})

require("lsp")
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
local signs = { Error = "●", Warn = "●", Hint = "●", Info = "●" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- vimtex setup
vim.g.tex_flavor = "latex"
vim.g.vimtex_view_automatic = 0
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_imaps_leader = ";"
vim.g.vimtex_fold_enabled = 1
vim.g.vimtex_view_method = "zathura"
vim.g.loaded_matchparen = 1
-- fixing the slowness of moving cursor
vim.g.vimtex_matchparen_enabled = 0

vim.g.vimtex_compiler_latexmk = {
	options = {
		"-verbose",
		"-file-line-error",
		"-synctex=1",
		"-interaction=nonstopmode",
		"-latexoption=-output-driver='xdvipdfmx -z3'",
		"-halt-on-error",
	},
}
-- undofir in tmpfs
-- local undodir = "/tmp/.undodir_" .. os.getenv("USER")
-- if not (os.rename(undodir, undodir)) then
-- 	os.execute("mkdir " .. undodir)
-- end
-- vim.o.undodir = undodir

require("autocmds")
require("fold")
require("settings")
require("key-binding")
