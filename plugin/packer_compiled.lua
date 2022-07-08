-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/yangxing/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/yangxing/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/yangxing/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/yangxing/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/yangxing/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nô\3\0\0\n\0\17\0\0316\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0019\1\4\0015\3\5\0004\4\0\b9\5\6\0005\6\n\0005\a\b\0004\b\3\0005\t\a\0>\t\1\b=\b\t\a=\a\v\6<\6\5\0049\5\f\0005\6\15\0005\a\14\0004\b\3\0005\t\r\0>\t\1\b=\b\t\a=\a\v\6<\6\5\4=\4\16\3B\1\2\1K\0\1\0\rext_opts\1\0\0\1\0\0\1\3\0\0\bâ—\fModeMsg\15insertNode\vactive\1\0\0\14virt_text\1\0\0\1\3\0\0\bâ—\fMoreMsg\15choiceNode\1\0\b\24region_check_events\16InsertEnter\17updateevents*TextChanged,TextChangedP,TextChangedI\24enable_autosnippets\2\fhistory\2\25store_selection_keys\n<tab>\22ext_prio_increase\3\1\18ext_base_prio\3¬\2\24delete_check_events\28InsertLeave,InsertEnter\15set_config\vconfig\fluasnip\23luasnip.util.types\frequire\0" },
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["code_runner.nvim"] = {
    config = { "\27LJ\2\nÒ\a\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\fproject\30~/playground/c++/dict_cpp\1\0\4\16description\17compile dict\fcommand\rmake run\14file_name\rmain.cpp\tname\22My Dictionary app\19~/deno/example\1\0\4\16description*Project with deno using other command\fcommand\25deno run --allow-net\14file_name\17http/main.ts\tname\15ExapleDeno\29~/playground/c++/open-gl\1\0\0\1\0\4\16description\26repo to learn open gl\fcommand\22make -C build run\14file_name\rmain.cpp\tname\21open gl learning\rfiletype\1\0\a\trustkcd $dir && mkdir -p .bin && rustc -g $fileName -o .bin/$fileNameWithoutExt && .bin/$fileNameWithoutExt\tjava;cd $dir && javac $fileName && java $fileNameWithoutExt\15typescript\rdeno run\6cicd $dir && mkdir -p .bin && gcc -g $fileName -o .bin/$fileNameWithoutExt && .bin/$fileNameWithoutExt\blua\tlua \vpython\fpython \bcppicd $dir && mkdir -p .bin && g++ -g $fileName -o .bin/$fileNameWithoutExt && .bin/$fileNameWithoutExt\tterm\1\0\1\tmode\15toggleterm\1\0\2\tsize\3\15\rposition\tvert\nsetup\16code_runner\frequire\0" },
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/code_runner.nvim",
    url = "https://github.com/CRAG666/code_runner.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n–\1\0\4\v\1\6\0\0196\4\0\0009\4\1\4'\6\2\0005\a\3\0\f\b\3\0X\b\1€4\b\0\0B\4\4\2\18\3\4\0006\4\0\0009\4\4\0049\4\5\4-\6\0\0\18\a\0\0\18\b\1\0\18\t\2\0\18\n\3\0B\4\6\1K\0\1\0\0À\24nvim_buf_set_keymap\bapi\1\0\2\fnoremap\2\vsilent\2\nforce\15tbl_extend\bvim€\b\1\1\b\0#\0Z3\1\0\0\18\2\1\0'\4\1\0'\5\2\0'\6\3\0005\a\4\0B\2\5\1\18\2\1\0'\4\1\0'\5\5\0'\6\6\0005\a\a\0B\2\5\1\18\2\1\0'\4\1\0'\5\b\0'\6\t\0B\2\4\1\18\2\1\0'\4\n\0'\5\b\0'\6\t\0B\2\4\1\18\2\1\0'\4\1\0'\5\v\0'\6\f\0B\2\4\1\18\2\1\0'\4\n\0'\5\v\0'\6\f\0B\2\4\1\18\2\1\0'\4\1\0'\5\r\0'\6\14\0B\2\4\1\18\2\1\0'\4\1\0'\5\15\0'\6\16\0B\2\4\1\18\2\1\0'\4\1\0'\5\17\0'\6\18\0B\2\4\1\18\2\1\0'\4\1\0'\5\19\0'\6\20\0B\2\4\1\18\2\1\0'\4\1\0'\5\21\0'\6\22\0B\2\4\1\18\2\1\0'\4\1\0'\5\23\0'\6\24\0B\2\4\1\18\2\1\0'\4\1\0'\5\25\0'\6\26\0B\2\4\1\18\2\1\0'\4\1\0'\5\27\0'\6\28\0B\2\4\1\18\2\1\0'\4\1\0'\5\29\0'\6\30\0B\2\4\1\18\2\1\0'\4\31\0'\5 \0'\6!\0B\2\4\1\18\2\1\0'\4\"\0'\5 \0'\6!\0B\2\4\0012\0\0€K\0\1\0\6x#:<C-U>Gitsigns select_hunk<CR>\aih\6o%<cmd>Gitsigns toggle_deleted<CR>\15<leader>td1<cmd>lua require\"gitsigns\".diffthis(\"~\")<CR>\15<leader>hD\31<cmd>Gitsigns diffthis<CR>\15<leader>hd0<cmd>Gitsigns toggle_current_line_blame<CR>\15<leader>tb9<cmd>lua require\"gitsigns\".blame_line{full=true}<CR>\15<leader>hb#<cmd>Gitsigns preview_hunk<CR>\15<leader>hp#<cmd>Gitsigns reset_buffer<CR>\15<leader>hR&<cmd>Gitsigns undo_stage_hunk<CR>\15<leader>hu#<cmd>Gitsigns stage_buffer<CR>\15<leader>hS\29:Gitsigns reset_hunk<CR>\15<leader>hr\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\0\1\texpr\0021&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'\a[c\1\0\1\texpr\0021&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'\a]c\6n\0æ\1\1\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0023\3\16\0=\3\17\2B\0\2\1K\0\1\0\14on_attach\0\nsigns\1\0\0\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\bâ€¾\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\6~\badd\1\0\0\1\0\1\ttext\6+\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n—\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\4\25component_separators\6|\23section_separators\5\ntheme\fonedark\18icons_enabled\1\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nö\1\0\0\a\0\f\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0004\3\5\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\4>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\6\4>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\a\4>\4\3\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\b\0049\4\t\4>\4\4\3=\3\v\2B\0\2\1K\0\1\0\fsources\1\0\0\veslint\16diagnostics\rbeautysh\ajq\vstylua\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nc\0\1\6\0\6\1\f9\1\0\0\18\3\1\0009\1\1\0019\4\2\0\23\4\0\0049\5\2\0B\1\4\0026\2\3\0009\2\4\0025\4\5\0\18\5\1\0D\2\3\0\1\4\0\0\a()\a[]\a{}\17tbl_contains\bvim\bcol\bsub\tline\2\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%)\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%}\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%]\nmatch\14prev_char­\4\1\0\b\0!\1T6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\6\0005\4\5\0=\4\a\0035\4\b\0=\4\t\3=\3\n\2B\0\2\0016\0\0\0'\2\v\0B\0\2\0026\1\0\0'\3\1\0B\1\2\0029\1\f\0014\3\5\0\18\4\0\0'\6\r\0'\a\r\0B\4\3\2\18\6\4\0009\4\14\0043\a\15\0B\4\3\2>\4\1\3\18\4\0\0'\6\16\0'\a\17\0B\4\3\2\18\6\4\0009\4\14\0043\a\18\0B\4\3\2\18\6\4\0009\4\19\0043\a\20\0B\4\3\2\18\6\4\0009\4\21\4'\a\22\0B\4\3\2>\4\2\3\18\4\0\0'\6\23\0'\a\24\0B\4\3\2\18\6\4\0009\4\14\0043\a\25\0B\4\3\2\18\6\4\0009\4\19\0043\a\26\0B\4\3\2\18\6\4\0009\4\21\4'\a\27\0B\4\3\2>\4\3\3\18\4\0\0'\6\28\0'\a\29\0B\4\3\2\18\6\4\0009\4\14\0043\a\30\0B\4\3\2\18\6\4\0009\4\19\0043\a\31\0B\4\3\2\18\6\4\0009\4\21\4'\a \0B\4\3\0?\4\0\0B\1\2\1K\0\1\0\6]\0\0\a ]\a[ \6}\0\0\a }\a{ \6)\fuse_key\0\14with_move\0\a )\a( \0\14with_pair\6 \14add_rules\24nvim-autopairs.rule\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\14fast_wrap\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\t€€À™\4\0" },
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireq\0\1\4\0\4\0\0146\1\0\0'\3\1\0B\1\2\0029\1\2\1B\1\1\2\15\0\1\0X\2\4€6\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\19expand_or_jump\23expand_or_jumpable\fluasnip\frequireU\0\1\4\0\3\0\0146\1\0\0009\1\1\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€6\1\0\0009\1\2\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\tjump\rjumpable\fluasnip_\0\1\4\0\3\0\r6\1\0\0009\1\1\1B\1\1\2\15\0\1\0X\2\5€6\1\0\0009\1\2\1)\3\1\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\18change_choice\18choice_active\fluasnip_\0\1\4\0\3\0\r6\1\0\0009\1\1\1B\1\1\2\15\0\1\0X\2\5€6\1\0\0009\1\2\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\18change_choice\18choice_active\fluasnipõ\a\1\0\v\0005\0†\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0026\1\0\0'\3\5\0B\1\2\0029\1\6\0015\3\n\0005\4\b\0003\5\a\0=\5\t\4=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\18\0006\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\17\5B\5\1\2=\5\19\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\20\5B\5\1\2=\5\21\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\22\5)\aüÿB\5\2\2=\5\23\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\22\5)\a\4\0B\5\2\2=\5\24\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\25\5B\5\1\2=\5\26\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\27\5B\5\1\2=\5\28\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\29\0055\a \0006\b\0\0'\n\5\0B\b\2\0029\b\30\b9\b\31\b=\b!\aB\5\2\2=\5\"\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0053\a#\0005\b$\0B\5\3\2=\5%\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0053\a&\0005\b'\0B\5\3\2=\5(\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0053\a)\0005\b*\0B\5\3\2=\5+\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0053\a,\0005\b-\0B\5\3\2=\5.\4=\4\16\0036\4\0\0'\6\5\0B\4\2\0029\4/\0049\0040\0044\6\3\0005\a1\0>\a\1\0064\a\4\0005\b2\0>\b\1\a5\b3\0>\b\2\a5\b4\0>\b\3\aB\4\3\2=\0040\3B\1\2\0017\0\4\0K\0\1\0\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\n<C-k>\1\3\0\0\6i\6s\0\n<C-j>\1\3\0\0\6i\6s\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\17experimental\1\0\1\15ghost_text\1\18PreselectMode\1\0\1\tItem\2\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\fluasnip\1\0\1\npaths\28~/.config/nvim/snippets\tload\29luasnip.loaders.from_lua\frequire\0" },
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nž\3\0\0\b\0\20\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\14\0004\5\4\0005\6\b\0005\a\a\0=\a\t\6>\6\1\0055\6\v\0005\a\n\0=\a\t\6>\6\2\0055\6\r\0005\a\f\0=\a\t\6>\6\3\5=\5\15\4=\4\16\3=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\ffilters\1\0\1\rdotfiles\2\tview\rmappings\tlist\1\0\0\1\0\1\vaction\vdir_up\1\3\0\0\6-\16<Backspace>\1\0\1\vaction\tedit\1\5\0\0\t<CR>\6o\18<2-LeftMouse>\6l\bkey\1\0\1\vaction\acd\1\3\0\0\19<2-RightMouse>\n<C-]>\1\0\4 preserve_window_proportions\2\tside\tleft\vheight\3\30\nwidth\3\30\24update_focused_file\1\0\0\1\0\2\15update_cwd\2\venable\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-ufo"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n¬\1\0\0\6\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0005\2\n\0005\3\b\0005\4\6\0005\5\5\0=\5\a\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\1\0\2\n<C-d>\1\n<C-u>\1\nsetup\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nb\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\17open_mapping\n<C-\\>\14direction\nfloat\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  vimtex = {
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/yangxing/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nô\3\0\0\n\0\17\0\0316\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0019\1\4\0015\3\5\0004\4\0\b9\5\6\0005\6\n\0005\a\b\0004\b\3\0005\t\a\0>\t\1\b=\b\t\a=\a\v\6<\6\5\0049\5\f\0005\6\15\0005\a\14\0004\b\3\0005\t\r\0>\t\1\b=\b\t\a=\a\v\6<\6\5\4=\4\16\3B\1\2\1K\0\1\0\rext_opts\1\0\0\1\0\0\1\3\0\0\bâ—\fModeMsg\15insertNode\vactive\1\0\0\14virt_text\1\0\0\1\3\0\0\bâ—\fMoreMsg\15choiceNode\1\0\b\24region_check_events\16InsertEnter\17updateevents*TextChanged,TextChangedP,TextChangedI\24enable_autosnippets\2\fhistory\2\25store_selection_keys\n<tab>\22ext_prio_increase\3\1\18ext_base_prio\3¬\2\24delete_check_events\28InsertLeave,InsertEnter\15set_config\vconfig\fluasnip\23luasnip.util.types\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n–\1\0\4\v\1\6\0\0196\4\0\0009\4\1\4'\6\2\0005\a\3\0\f\b\3\0X\b\1€4\b\0\0B\4\4\2\18\3\4\0006\4\0\0009\4\4\0049\4\5\4-\6\0\0\18\a\0\0\18\b\1\0\18\t\2\0\18\n\3\0B\4\6\1K\0\1\0\0À\24nvim_buf_set_keymap\bapi\1\0\2\fnoremap\2\vsilent\2\nforce\15tbl_extend\bvim€\b\1\1\b\0#\0Z3\1\0\0\18\2\1\0'\4\1\0'\5\2\0'\6\3\0005\a\4\0B\2\5\1\18\2\1\0'\4\1\0'\5\5\0'\6\6\0005\a\a\0B\2\5\1\18\2\1\0'\4\1\0'\5\b\0'\6\t\0B\2\4\1\18\2\1\0'\4\n\0'\5\b\0'\6\t\0B\2\4\1\18\2\1\0'\4\1\0'\5\v\0'\6\f\0B\2\4\1\18\2\1\0'\4\n\0'\5\v\0'\6\f\0B\2\4\1\18\2\1\0'\4\1\0'\5\r\0'\6\14\0B\2\4\1\18\2\1\0'\4\1\0'\5\15\0'\6\16\0B\2\4\1\18\2\1\0'\4\1\0'\5\17\0'\6\18\0B\2\4\1\18\2\1\0'\4\1\0'\5\19\0'\6\20\0B\2\4\1\18\2\1\0'\4\1\0'\5\21\0'\6\22\0B\2\4\1\18\2\1\0'\4\1\0'\5\23\0'\6\24\0B\2\4\1\18\2\1\0'\4\1\0'\5\25\0'\6\26\0B\2\4\1\18\2\1\0'\4\1\0'\5\27\0'\6\28\0B\2\4\1\18\2\1\0'\4\1\0'\5\29\0'\6\30\0B\2\4\1\18\2\1\0'\4\31\0'\5 \0'\6!\0B\2\4\1\18\2\1\0'\4\"\0'\5 \0'\6!\0B\2\4\0012\0\0€K\0\1\0\6x#:<C-U>Gitsigns select_hunk<CR>\aih\6o%<cmd>Gitsigns toggle_deleted<CR>\15<leader>td1<cmd>lua require\"gitsigns\".diffthis(\"~\")<CR>\15<leader>hD\31<cmd>Gitsigns diffthis<CR>\15<leader>hd0<cmd>Gitsigns toggle_current_line_blame<CR>\15<leader>tb9<cmd>lua require\"gitsigns\".blame_line{full=true}<CR>\15<leader>hb#<cmd>Gitsigns preview_hunk<CR>\15<leader>hp#<cmd>Gitsigns reset_buffer<CR>\15<leader>hR&<cmd>Gitsigns undo_stage_hunk<CR>\15<leader>hu#<cmd>Gitsigns stage_buffer<CR>\15<leader>hS\29:Gitsigns reset_hunk<CR>\15<leader>hr\6v\29:Gitsigns stage_hunk<CR>\15<leader>hs\1\0\1\texpr\0021&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'\a[c\1\0\1\texpr\0021&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'\a]c\6n\0æ\1\1\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0023\3\16\0=\3\17\2B\0\2\1K\0\1\0\14on_attach\0\nsigns\1\0\0\17changedelete\1\0\1\ttext\6~\14topdelete\1\0\1\ttext\bâ€¾\vdelete\1\0\1\ttext\6_\vchange\1\0\1\ttext\6~\badd\1\0\0\1\0\1\ttext\6+\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireq\0\1\4\0\4\0\0146\1\0\0'\3\1\0B\1\2\0029\1\2\1B\1\1\2\15\0\1\0X\2\4€6\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\19expand_or_jump\23expand_or_jumpable\fluasnip\frequireU\0\1\4\0\3\0\0146\1\0\0009\1\1\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€6\1\0\0009\1\2\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\tjump\rjumpable\fluasnip_\0\1\4\0\3\0\r6\1\0\0009\1\1\1B\1\1\2\15\0\1\0X\2\5€6\1\0\0009\1\2\1)\3\1\0B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\18change_choice\18choice_active\fluasnip_\0\1\4\0\3\0\r6\1\0\0009\1\1\1B\1\1\2\15\0\1\0X\2\5€6\1\0\0009\1\2\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\18change_choice\18choice_active\fluasnipõ\a\1\0\v\0005\0†\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0026\1\0\0'\3\5\0B\1\2\0029\1\6\0015\3\n\0005\4\b\0003\5\a\0=\5\t\4=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\18\0006\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\17\5B\5\1\2=\5\19\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\20\5B\5\1\2=\5\21\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\22\5)\aüÿB\5\2\2=\5\23\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\22\5)\a\4\0B\5\2\2=\5\24\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\25\5B\5\1\2=\5\26\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\27\5B\5\1\2=\5\28\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0059\5\29\0055\a \0006\b\0\0'\n\5\0B\b\2\0029\b\30\b9\b\31\b=\b!\aB\5\2\2=\5\"\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0053\a#\0005\b$\0B\5\3\2=\5%\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0053\a&\0005\b'\0B\5\3\2=\5(\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0053\a)\0005\b*\0B\5\3\2=\5+\0046\5\0\0'\a\5\0B\5\2\0029\5\16\0053\a,\0005\b-\0B\5\3\2=\5.\4=\4\16\0036\4\0\0'\6\5\0B\4\2\0029\4/\0049\0040\0044\6\3\0005\a1\0>\a\1\0064\a\4\0005\b2\0>\b\1\a5\b3\0>\b\2\a5\b4\0>\b\3\aB\4\3\2=\0040\3B\1\2\0017\0\4\0K\0\1\0\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\n<C-k>\1\3\0\0\6i\6s\0\n<C-j>\1\3\0\0\6i\6s\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\17experimental\1\0\1\15ghost_text\1\18PreselectMode\1\0\1\tItem\2\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\fluasnip\1\0\1\npaths\28~/.config/nvim/snippets\tload\29luasnip.loaders.from_lua\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n¬\1\0\0\6\0\f\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\4\0005\2\n\0005\3\b\0005\4\6\0005\5\5\0=\5\a\4=\4\t\3=\3\v\2B\0\2\1K\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\1\0\2\n<C-d>\1\n<C-u>\1\nsetup\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nb\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\17open_mapping\n<C-\\>\14direction\nfloat\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n—\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\4\25component_separators\6|\23section_separators\5\ntheme\fonedark\18icons_enabled\1\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nc\0\1\6\0\6\1\f9\1\0\0\18\3\1\0009\1\1\0019\4\2\0\23\4\0\0049\5\2\0B\1\4\0026\2\3\0009\2\4\0025\4\5\0\18\5\1\0D\2\3\0\1\4\0\0\a()\a[]\a{}\17tbl_contains\bvim\bcol\bsub\tline\2\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%)\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%}\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%]\nmatch\14prev_char­\4\1\0\b\0!\1T6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\6\0005\4\5\0=\4\a\0035\4\b\0=\4\t\3=\3\n\2B\0\2\0016\0\0\0'\2\v\0B\0\2\0026\1\0\0'\3\1\0B\1\2\0029\1\f\0014\3\5\0\18\4\0\0'\6\r\0'\a\r\0B\4\3\2\18\6\4\0009\4\14\0043\a\15\0B\4\3\2>\4\1\3\18\4\0\0'\6\16\0'\a\17\0B\4\3\2\18\6\4\0009\4\14\0043\a\18\0B\4\3\2\18\6\4\0009\4\19\0043\a\20\0B\4\3\2\18\6\4\0009\4\21\4'\a\22\0B\4\3\2>\4\2\3\18\4\0\0'\6\23\0'\a\24\0B\4\3\2\18\6\4\0009\4\14\0043\a\25\0B\4\3\2\18\6\4\0009\4\19\0043\a\26\0B\4\3\2\18\6\4\0009\4\21\4'\a\27\0B\4\3\2>\4\3\3\18\4\0\0'\6\28\0'\a\29\0B\4\3\2\18\6\4\0009\4\14\0043\a\30\0B\4\3\2\18\6\4\0009\4\19\0043\a\31\0B\4\3\2\18\6\4\0009\4\21\4'\a \0B\4\3\0?\4\0\0B\1\2\1K\0\1\0\6]\0\0\a ]\a[ \6}\0\0\a }\a{ \6)\fuse_key\0\14with_move\0\a )\a( \0\14with_pair\6 \14add_rules\24nvim-autopairs.rule\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\1\tjava\1\1\2\0\0\vstring\14fast_wrap\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\t€€À™\4\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nž\3\0\0\b\0\20\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\14\0004\5\4\0005\6\b\0005\a\a\0=\a\t\6>\6\1\0055\6\v\0005\a\n\0=\a\t\6>\6\2\0055\6\r\0005\a\f\0=\a\t\6>\6\3\5=\5\15\4=\4\16\3=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\ffilters\1\0\1\rdotfiles\2\tview\rmappings\tlist\1\0\0\1\0\1\vaction\vdir_up\1\3\0\0\6-\16<Backspace>\1\0\1\vaction\tedit\1\5\0\0\t<CR>\6o\18<2-LeftMouse>\6l\bkey\1\0\1\vaction\acd\1\3\0\0\19<2-RightMouse>\n<C-]>\1\0\4 preserve_window_proportions\2\tside\tleft\vheight\3\30\nwidth\3\30\24update_focused_file\1\0\0\1\0\2\15update_cwd\2\venable\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nö\1\0\0\a\0\f\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0004\3\5\0006\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\5\4>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\6\4>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\4\0049\4\a\4>\4\3\0036\4\0\0'\6\1\0B\4\2\0029\4\3\0049\4\b\0049\4\t\4>\4\4\3=\3\v\2B\0\2\1K\0\1\0\fsources\1\0\0\veslint\16diagnostics\rbeautysh\ajq\vstylua\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: code_runner.nvim
time([[Config for code_runner.nvim]], true)
try_loadstring("\27LJ\2\nÒ\a\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\fproject\30~/playground/c++/dict_cpp\1\0\4\16description\17compile dict\fcommand\rmake run\14file_name\rmain.cpp\tname\22My Dictionary app\19~/deno/example\1\0\4\16description*Project with deno using other command\fcommand\25deno run --allow-net\14file_name\17http/main.ts\tname\15ExapleDeno\29~/playground/c++/open-gl\1\0\0\1\0\4\16description\26repo to learn open gl\fcommand\22make -C build run\14file_name\rmain.cpp\tname\21open gl learning\rfiletype\1\0\a\trustkcd $dir && mkdir -p .bin && rustc -g $fileName -o .bin/$fileNameWithoutExt && .bin/$fileNameWithoutExt\tjava;cd $dir && javac $fileName && java $fileNameWithoutExt\15typescript\rdeno run\6cicd $dir && mkdir -p .bin && gcc -g $fileName -o .bin/$fileNameWithoutExt && .bin/$fileNameWithoutExt\blua\tlua \vpython\fpython \bcppicd $dir && mkdir -p .bin && g++ -g $fileName -o .bin/$fileNameWithoutExt && .bin/$fileNameWithoutExt\tterm\1\0\1\tmode\15toggleterm\1\0\2\tsize\3\15\rposition\tvert\nsetup\16code_runner\frequire\0", "config", "code_runner.nvim")
time([[Config for code_runner.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
