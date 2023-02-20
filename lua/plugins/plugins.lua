return {
	{
		"folke/which-key.nvim",
		lazy = true,
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
	"kevinhwang91/nvim-bqf",
	{ "rafamadriz/friendly-snippets", lazy = true },
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-\>]],
				direction = "float",
				shade_terminals = true,
				float_opts = {
					border = curved,
					winblend = 7,
				},
			})
		end,
	},
	{ "p00f/nvim-ts-rainbow", event = "InsertEnter" },
	{
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig",
		event = "VeryLazy",
	},
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			require("dap_config.init").setup()
		end,
	},

	{ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }, event = "VeryLazy" },
	{ "norcalli/nvim-colorizer.lua", cmd = "ColorierAttachToBuffer" },
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				transparent = true,
				term_colors = true,
			})
			require("onedark").load()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
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
					nls.builtins.formatting.jq,
				},
			}
		end,
	},
	{ "williamboman/mason.nvim", event = "VeryLazy" },
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
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
	{ "nvim-treesitter/nvim-treesitter", event = "VeryLazy" },
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "VeryLazy",
		config = function()
			require("treesitter").treesitter()
			require("treesitter").treesitter_obj()
		end,
	},

	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{ "nvim-telescope/telescope.nvim", event = "VeryLazy" },
	{ "neovim/nvim-lspconfig", event = "VeryLazy" },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
			require("luasnip.loaders.from_vscode").lazy_load()
			luasnip =
				require("luasnip"), require("cmp").setup({

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
						{ name = "luasnip" },
						{ name = "buffer" },
						{ name = "path" },
					}),
				})
		end,
	},
	{ "mfussenegger/nvim-dap-python", ft = "python" },
	{ "hrsh7th/cmp-nvim-lsp", event = "VeryLazy" },
	{ "hrsh7th/cmp-path", event = "VeryLazy" },
	{ "saadparwaiz1/cmp_luasnip", event = "VeryLazy" },
	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
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
	{ "lervag/vimtex", event = "VeryLazy" },
	{
		"kyazdani42/nvim-tree.lua",
		event = "VeryLazy",
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
		event = "VeryLazy",
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
}
