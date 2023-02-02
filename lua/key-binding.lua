local ls = require("luasnip")
local util = require("luasnip.util.util")
local node_util = require("luasnip.nodes.util")

local function find_dynamic_node(node)
	-- the dynamicNode-key is set on snippets generated by a dynamicNode only (its'
	-- actual use is to refer to the dynamicNode that generated the snippet).
	while not node.dynamicNode do
		node = node.parent
	end
	return node.dynamicNode
end

local external_update_id = 0
-- func_indx to update the dynamicNode with different functions.
function dynamic_node_external_update(func_indx)
	-- most of this function is about restoring the cursor to the correct
	-- position+mode, the important part are the few lines from
	-- `dynamic_node.snip:store()`.


	-- find current node and the innermost dynamicNode it is inside.
	local current_node = ls.session.current_nodes[vim.api.nvim_get_current_buf()]
	local dynamic_node = find_dynamic_node(current_node)

	-- to identify current node in new snippet, if it is available.
	external_update_id = external_update_id + 1
	current_node.external_update_id = external_update_id

	-- store which mode we're in to restore later.
	local insert_pre_call = vim.fn.mode() == "i"
	-- is byte-indexed! Doesn't matter here, but important to be aware of.
	local cursor_pos_pre_relative = util.pos_sub(
		util.get_cursor_0ind(),
		current_node.mark:pos_begin_raw()
	)

	-- leave current generated snippet.
	node_util.leave_nodes_between(dynamic_node.snip, current_node)

	-- call update-function.
	local func = dynamic_node.user_args[func_indx]
	if func then
		-- the same snippet passed to the dynamicNode-function. Any output from func
		-- should be stored in it under some unused key.
		func(dynamic_node.parent.snippet)
	end

	-- last_args is used to store the last args that were used to generate the
	-- snippet. If this function is called, these will most probably not have
	-- changed, so they are set to nil, which will force an update.
	dynamic_node.last_args = nil
	dynamic_node:update()

	-- everything below here isn't strictly necessary, but it's pretty nice to have.


	-- try to find the node we marked earlier.
	local target_node = dynamic_node:find_node(function(test_node)
		return test_node.external_update_id == external_update_id
	end)

	if target_node then
		-- the node that the cursor was in when changeChoice was called exists
		-- in the active choice! Enter it and all nodes between it and this choiceNode,
		-- then set the cursor.
		node_util.enter_nodes_between(dynamic_node, target_node)

		if insert_pre_call then
			util.set_cursor_0ind(
				util.pos_add(
					target_node.mark:pos_begin_raw(),
					cursor_pos_pre_relative
				)
			)
		else
			node_util.select_node(target_node)
		end
		-- set the new current node correctly.
		ls.session.current_nodes[vim.api.nvim_get_current_buf()] = target_node
	else
		-- the marked node wasn't found, just jump into the new snippet noremally.
		ls.session.current_nodes[vim.api.nvim_get_current_buf()] = dynamic_node.snip:jump_into(1)
	end
end

--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })
-------------
--  nmaps  --
-------------

-- Utility maps for repeatable quickly change/delete current word
vim.keymap.set("n", "c*", "*``cgn")
vim.keymap.set("n", "c#", "*``cgN")
vim.keymap.set("n", "cg*", "g*``cgn")
vim.keymap.set("n", "cg#", "g*``cgN")
vim.keymap.set("n", "d*", "*``dgn")
vim.keymap.set("n", "d#", "*``dgN")
vim.keymap.set("n", "dg*", "g*``dgn")
vim.keymap.set("n", "dg#", "g*``dgN")
vim.keymap.set("n", "gV", "`[V`]")
-- Buffer navigation
vim.keymap.set("n", "]b", ":bnext<cr>")
vim.keymap.set("n", "[b", ":bprevious<cr>")
vim.keymap.set("n", "]B", ":blast<cr>")
vim.keymap.set("n", "[B", ":bfirst<cr>")
-- quick edit
vim.keymap.set("n", "<leader>xv", ":source $MYVIMRC <CR>")
vim.keymap.set("n", "<leader>ev", ":tabedit $MYVIMRC <CR>")
vim.keymap.set("n", "U", "<c-r>")
-- keep the next and previous search result centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ'")
-- backspace to fold
vim.keymap.set("n", "<backspace>", "za")
vim.keymap.set("n", "<leader>es", function()
	return require("luasnip.loaders.from_lua").edit_snippet_files()
end)

vim.keymap.set("n", "<leader><space>", [[<cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sf", function()
	return require("telescope.builtin").find_files({ previewer = false })
end)
vim.keymap.set("n", "<leader>sb", function()
	return require("telescope.builtin").current_buffer_fuzzy_find()
end)
vim.keymap.set("n", "<leader>sh", function()
	return require("telescope.builtin").help_tags()
end)
vim.keymap.set("n", "<leader>st", function()
	return require("telescope.builtin").tags()
end)
vim.keymap.set("n", "<leader>sd", function()
	return require("telescope.builtin").grep_string()
end)
vim.keymap.set("n", "<leader>sp", function()
	return require("telescope.builtin").live_grep()
end)
vim.keymap.set("n", "<leader>so", function()
	return require("telescope.builtin").tags({ only_current_buffer = true })
end)
vim.keymap.set("n", "<leader>?", function()
	return require("telescope.builtin").oldfiles()
end)
vim.api.nvim_set_keymap('i', "<C-t>", '<cmd>lua _G.dynamic_node_external_update(1)<Cr>', {noremap = true})
vim.api.nvim_set_keymap('s', "<C-t>", '<cmd>lua _G.dynamic_node_external_update(1)<Cr>', {noremap = true})

vim.api.nvim_set_keymap('i', "<C-g>", '<cmd>lua _G.dynamic_node_external_update(2)<Cr>', {noremap = true})
vim.api.nvim_set_keymap('s', "<C-g>", '<cmd>lua _G.dynamic_node_external_update(2)<Cr>', {noremap = true})

vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w><C-j>a")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w><C-k>a")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "ff", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>d", function()
	diagnostics_active = not diagnostics_active
	if diagnostics_active then
		vim.diagnostic.show()
	else
		vim.diagnostic.hide()
	end
end)
-- code_runner keybinding
vim.keymap.set("n", "<leader>r", ":RunCode<CR>")
vim.keymap.set("n", "<leader>rf", ":RunFile<CR>")
vim.keymap.set("n", "<leader>rp", ":RunProject<CR>")
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>")
vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>")
vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>")
