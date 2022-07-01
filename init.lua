require("settings")
require("key-binding")
require("treesitter").treesitter()
require("treesitter").treesitter_obj()
require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Package manager
	use("tpope/vim-fugitive") -- Git commands in nvim
	use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
	use("numToStr/Comment.nvim") -- "gc" to comment visual regions/lines
	use("p00f/nvim-ts-rainbow")
	use("lewis6991/impatient.nvim")
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	-- Lua
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	-- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
	use("norcalli/nvim-colorizer.lua")
	-- UI to select things (files, grep results, open buffers...)
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("navarasu/onedark.nvim") -- Theme inspired by Atom
	use("nvim-lualine/lualine.nvim") -- Fancier statusline
	-- Add indentation guides even on blank lines
	-- use("lukas-reineke/indent-blankline.nvim")
	-- Add git related info in the signs columns and popups
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use("nvim-treesitter/nvim-treesitter")
	-- Additional textobjects for treesitter
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use({ "mfussenegger/nvim-dap-python" })
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("tpope/vim-surround") -- vim surround
	use("jose-elias-alvarez/null-ls.nvim")
	use("lervag/vimtex")
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function() end,
	})
	use("windwp/nvim-autopairs")
	use({ "CRAG666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" })
end)

require("impatient")
local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup({
	check_ts = true,
	fast_wrap = {},
	ts_config = {
		lua = { "string" }, -- it will not add a pair on that treesitter node
		javascript = { "template_string" },
		java = false, -- don't check treesitter on java
	},
})
npairs.add_rules({
	Rule(" ", " "):with_pair(function(opts)
		local pair = opts.line:sub(opts.col - 1, opts.col)
		return vim.tbl_contains({ "()", "[]", "{}" }, pair)
	end),
	Rule("( ", " )")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%)") ~= nil
		end)
		:use_key(")"),
	Rule("{ ", " }")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%}") ~= nil
		end)
		:use_key("}"),
	Rule("[ ", " ]")
		:with_pair(function()
			return false
		end)
		:with_move(function(opts)
			return opts.prev_char:match(".%]") ~= nil
		end)
		:use_key("]"),
})

--Set statusbar
require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = "onedark",
		component_separators = "|",
		section_separators = "",
	},
})

--Enable Comment.nvim
require("Comment").setup()
require("code_runner").setup({
	term = {
		position = "belowright",
		size = 8,
		mode = "",
	},
	filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python ",
		lua = "lua ",
		typescript = "deno run",
		rust = "cd $dir && mkdir -p .bin && rustc -g $fileName -o .bin/$fileNameWithoutExt && .bin/$fileNameWithoutExt",
		cpp = "cd $dir && mkdir -p .bin && g++ -g $fileName -o .bin/$fileNameWithoutExt && .bin/$fileNameWithoutExt",
		c = "cd $dir && mkdir -p .bin && gcc -g $fileName -o .bin/$fileNameWithoutExt && .bin/$fileNameWithoutExt",
	},
	project = {
		["~/playground/c++/open-gl"] = {
			name = "open gl learning",
			description = "repo to learn open gl",
			file_name = "main.cpp",
			command = "make -C build run",
		},
		["~/deno/example"] = {
			name = "ExapleDeno",
			description = "Project with deno using other command",
			file_name = "http/main.ts",
			command = "deno run --allow-net",
		},
	},
})

--Map blankline
-- require("indent_blankline").setup({
-- 	space_char_blankline = " ",
-- 	-- show_current_context = true,
-- 	max_indent_increase = 1,
-- 	filetype_exclude = { "help", "packer" },
-- 	buftype_exclude = { "terminal", "nofile" },
-- 	show_trailing_blankline_indent = false,
-- 	use_treesitter = true,
-- 	show_first_indent_level = false,
-- })
-- Gitsigns
require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
	on_attach = function(bufnr)
		local function map(mode, lhs, rhs, opts)
			opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
			vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
		end

		-- Navigation
		map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
		map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

		-- Actions
		map("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
		map("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
		map("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
		map("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
		map("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
		map("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
		map("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
		map("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
		map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
		map("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
		map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
		map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
		map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")

		-- Text object
		map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
		map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})

-- Telescope
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
})

-- Enable telescope fzf native
require("telescope").load_extension("fzf")

-- nvim-tree
require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		width = 30,
		height = 30,
		side = "left",
		preserve_window_proportions = true,
		mappings = {
			list = {
				{ key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
				{ key = { "<CR>", "o", "<2-LeftMouse>", "l" }, action = "edit" },
				{ key = { "-", "<Backspace>" }, action = "dir_up" },
			},
		},
	},

	filters = {
		dotfiles = true,
	},
})

-- Diagnostic keymaps
-- LSP settings
local lspconfig = require("lspconfig")
vim.lsp.set_log_level("error")
local on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>so",
		[[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
		opts
	)
end
-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

lspconfig.pylsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				configurationSources = { "flake8", "mypy" },
				flake8 = { enabled = true, maxLineLength = 120 },
				jedi_completion = {
					enabled = true,
					include_params = true,
				},
				mypy = { enabled = false },
				pycodestyle = { enabled = false },
				pyflakes = { enabled = false },
			},
		},
	},
})

-- Enable the following language servers
local servers = { "rust_analyzer", "tsserver", "clangd", "texlab" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- luasnip setup
local luasnip = require("luasnip")
local types = require("luasnip.util.types")
require("luasnip").config.set_config({
	history = true,
	enable_autosnippets = true,
	updateevents = "TextChanged,TextChangedP,TextChangedI",
	-- region_check_events = "CursorMoved,CursorHold,InsertEnter",
	region_check_events = "InsertEnter",
	-- delete_check_events = "TextChangedI,TextChangedP,TextChanged",
	delete_check_events = "InsertLeave,InsertEnter",
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "MoreMsg" } },
			},
		},
		[types.insertNode] = {
			active = {
				virt_text = { { "●", "ModeMsg" } },
			},
		},
	},
	store_selection_keys = "<tab>",
})
-- nvim-cmp setup
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	PreselectMode = {
		Item = true,
	},
	experimental = {
		ghost_text = false,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-j>"] = cmp.mapping(function(fallback)
			if luasnip.choice_active() then
				luasnip.change_choice(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-k>"] = cmp.mapping(function(fallback)
			if luasnip.choice_active() then
				luasnip.change_choice(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	}, {
		{ name = "luasnip" }, -- For luasnip users.
		{ name = "buffer" },
		{ name = "path" },
	}),
})
-- null-ls setup
require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.jq,
		require("null-ls").builtins.diagnostics.eslint,
	},
})
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
})
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
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
local undodir = "/tmp/.undodir_" .. os.getenv("USER")
if not (os.rename(undodir, undodir)) then
	os.execute("mkdir " .. undodir)
end
vim.o.undodir = undodir

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	command = "setlocal formatoptions -=c formatoptions -=r formatoptions -=o ", --disable auto commenting
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

vim.api.nvim_set_hl(0, "Conceal", { guibg = none })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { guibg = none })

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

-- debugger setterings
require("dap.init").setup()
require("fold")
