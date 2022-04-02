local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.t
local i = ls.i
local f = ls.f
-- local c = ls.c
-- local d = ls.d
-- local pi = ls.parent_indexer
-- local isn = require("luasnip.nodes.snippet").ISN
-- local psn = require("luasnip.nodes.snippet").PSN
-- local l = require("luasnip.extras").l
-- local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
-- local types = require("luasnip.util.types")
-- local events = require("luasnip.util.events")
-- local util = require("luasnip.util.util")

return {
	ls.parser.parse_snippet("mail", "yangxing844@gmail.com"),
	s({ trig = "ymd", name = "Current date", dscr = "Insert the current date" }, {
		p(os.date, "%Y-%m-%d"),
	}),
	s({ trig = "snip", name = "snip for luasnip", decr = "expand to a snippet template" }, {
		t('s({ trig="'),
		i(1, "trigger"),
		t('" }, t{'),
		i(2, "node"),
		t("})"),
		i(0),
	}),

	s(
		{ trig = "b(%d)(%w+)", regTrig = true },
		f(function(_, snip)
			return "Captured Text: " .. snip.captures[1] .. snip.captures[2] .. "."
		end, {})
	),

	s("line", {
		i(1, "text_of_first"),
		i(2, { "first_line_of_second", "second_line_of_second" }),
		-- order is 2,1, not 1,2!!
		f(function(args, _)
			return args[1][1]
			--here
		end, { 2, 1 }),
	}),

	s("trigger", {
		i(1, "First jump"),
		t(" :: "),
		sn(2, {
			i(1, "Second jump"),
			t(" : "),
			i(2, "Third jump"),
		}),
	}),
}
