local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
require("lazy").setup({
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register({
				mode = { "n", "v" },
				["g"] = { name = "+goto" },
				["gz"] = { name = "+surround" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
				["<leader><tab>"] = { name = "+tabs" },
				["<leader>b"] = { name = "+buffer" },
				["<leader>c"] = { name = "+code" },
				["<leader>f"] = { name = "+file/find" },
				["<leader>g"] = { name = "+git" },
				["<leader>gh"] = { name = "+hunks" },
				["<leader>q"] = { name = "+quit/session" },
				["<leader>s"] = { name = "+search" },
				["<leader>sn"] = { name = "+noice" },
				["<leader>u"] = { name = "+ui" },
				["<leader>w"] = { name = "+windows" },
				["<leader>x"] = { name = "+diagnostics/quickfix" },
			})
		end,
	},
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	"kevinhwang91/nvim-bqf",
	"rafamadriz/friendly-snippets",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-\>]],
				direction = "float",
				shade_terminals = false,
				float_opts = {
					border = curved,
					winblend = 7,
				},
			})
		end,
	},
	"p00f/nvim-ts-rainbow",
	{
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
	},
	"mfussenegger/nvim-dap",
	{ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
	"norcalli/nvim-colorizer.lua",
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				transparent = true,
				term_colors = true,
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = false,
					theme = "onedark",
					component_separators = "|",
					section_separators = "",
				},
			})
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					-- nls.builtins.formatting.prettierd,
					nls.builtins.formatting.stylua,
					nls.builtins.diagnostics.flake8,
				},
			}
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
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
		end,
	},
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/nvim-treesitter-textobjects",

	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost", "BufNewFile" },
		config = true,
		-- stylua: ignore
		keys = {
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous todo comment",
			},
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
			{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
		},
	},
	"neovim/nvim-lspconfig",
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
			luasnip =
				require("luasnip"),
				require("cmp").setup({

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
						["<C-p>"] = require("cmp").mapping.select_prev_item(),
						["<C-n>"] = require("cmp").mapping.select_next_item(),
						["<C-d>"] = require("cmp").mapping.scroll_docs(-4),
						["<C-f>"] = require("cmp").mapping.scroll_docs(4),
						["<C-Space>"] = require("cmp").mapping.complete(),
						["<C-e>"] = require("cmp").mapping.close(),
						["<CR>"] = require("cmp").mapping.confirm({
							behavior = require("cmp").ConfirmBehavior.Replace,
							select = false,
						}),
						["<Tab>"] = require("cmp").mapping(function(fallback)
							if require("luasnip").expand_or_jumpable() then
								luasnip.expand_or_jump()
							else
								fallback()
							end
						end, { "i", "s" }),

						["<S-Tab>"] = require("cmp").mapping(function(fallback)
							if luasnip.jumpable(-1) then
								luasnip.jump(-1)
							else
								fallback()
							end
						end, { "i", "s" }),

						["<C-j>"] = require("cmp").mapping(function(fallback)
							if luasnip.choice_active() then
								luasnip.change_choice(1)
							else
								fallback()
							end
						end, { "i", "s" }),
						["<C-k>"] = require("cmp").mapping(function(fallback)
							if luasnip.choice_active() then
								luasnip.change_choice(-1)
							else
								fallback()
							end
						end, { "i", "s" }),
					},
					sources = require("cmp").config.sources({
						{ name = "nvim_lsp" },
					}, {
						{ name = "luasnip" }, -- For luasnip users.
						{ name = "buffer" },
						{ name = "path" },
					}),
				})
		end,
	},
	"mfussenegger/nvim-dap-python",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	{
		"L3MON4D3/LuaSnip",
		config = function()
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
		end,
	},
	"lervag/vimtex",
	{
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("nvim-tree").setup({
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},
				view = {
					width = 30,
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
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
				fast_wrap = {},
				ts_config = {
					lua = { "string" }, -- it will not add a pair on that treesitter node
					javascript = { "template_string" },
					java = false, -- don't check treesitter on java
				},
			})
			local Rule = require("nvim-autopairs.rule")
			require("nvim-autopairs").add_rules({
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
		end,
	},
	{
		"CRAG666/code_runner.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("code_runner").setup({
				term = { position = "vert", size = 15 },
				mode = "toggleterm",
				filetype = {
					java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
					python = "python ",
					lua = "lua ",
					rust = "cd $dir && mkdir -p .bin && rustc -g $fileName -o .bin/$fileNameWithoutExt && .bin/$fileNameWithoutExt",
					cpp = "cd $dir && mkdir -p .bin && g++ -g $fileName -o .bin/$fileNameWithoutExt && .bin/$fileNameWithoutExt",
					c = "cd $dir && mkdir -p .bin && gcc -g $fileName -o .bin/$fileNameWithoutExt && .bin/$fileNameWithoutExt",
				},
				project = {
					["~/playground/c++/open-gl"] = {
						name = "open gl learning",
						description = "repo to learn open gl",
						file_name = "main.cpp",
						command = "cmake build && make -C build run",
					},
					["~/playground/c++/dict_cpp"] = {
						name = "My Dictionary app",
						description = "compile dict",
						command = "make run",
					},
				},
			})
		end,
	},
})
-- setup

vim.lsp.set_log_level("error")
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
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
	require("nvim-navic").attach(client, bufnr)
end
-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Enable the following language servers

local lspconfig = require("lspconfig")
local servers = { "rust_analyzer", "tsserver", "clangd", "texlab", "pyright" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

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
local undodir = "/tmp/.undodir_" .. os.getenv("USER")
if not (os.rename(undodir, undodir)) then
	os.execute("mkdir " .. undodir)
end
vim.o.undodir = undodir

require("autocmds")
require("fold")
require("settings")
require("key-binding")
require("treesitter").treesitter()
require("treesitter").treesitter_obj()
require("dap_config.init").setup()
require("luasnip.loaders.from_vscode").lazy_load()
