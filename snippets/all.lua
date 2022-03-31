
local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.t
local i = ls.i
local f = ls.f
local c = ls.c
local d = ls.d
local pi = ls.parent_indexer
local isn = require("luasnip.nodes.snippet").ISN
local psn = require("luasnip.nodes.snippet").PSN
local l = require'luasnip.extras'.l
local r = require'luasnip.extras'.rep
local p = require("luasnip.extras").partial
local types = require("luasnip.util.types")
local events = require("luasnip.util.events")
local util = require("luasnip.util.util")

return {
	ls.parser.parse_snippet("trig", "loaded!!"),
	s({ trig = "ymd", name = "Current date", dscr = "Insert the current date" }, {
				p(os.date, "%Y-%m-%d"),
			}),
}
