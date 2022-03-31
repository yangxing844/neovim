local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.t
local i = ls.i
-- local f = ls.f
local c = ls.c
local d = ls.d
-- local pi = ls.parent_indexer
-- local isn = require("luasnip.nodes.snippet").ISN
-- local psn = require("luasnip.nodes.snippet").PSN
-- local l = require("luasnip.extras").l
-- local r = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local types = require("luasnip.util.types")
-- local events = require("luasnip.util.events")
-- local util = require("luasnip.util.util")
local tex = {}

tex.in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex.in_text = function()
	return not tex.in_mathzone()
end

local rec_ls
rec_ls = function()
	return sn(nil, {
		c(1, {
			-- important!! Having the sn(...) as the first choice will cause infinite recursion.
			t({ "" }),
			-- The same dynamicNode as in the snippet (also note: self reference).
			sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
		}),
	})
end

return { s("dm", {
	t({ "\\[", "\t" }),
	i(1),
	t({ "", "\\]" }),
}, { condition = tex.in_text }) }, {
	s("ls", {
		t({ "\\begin{itemize}", "\t\\item " }),
		i(1),
		d(2, rec_ls, {}),
		t({ "", "\\end{itemize}" }),
		i(0),
	}, { condition = tex.in_text }),
}
