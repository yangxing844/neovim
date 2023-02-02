vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	command = "setlocal formatoptions -=c formatoptions -=r formatoptions -=o ", --disable auto commenting after o
})

vim.api.nvim_create_autocmd("BufReadPost", {
	command = [[ if line("'\"")>1 && line("'\"") <=line("$") | execute "normal! g`\"" | endif]],
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
