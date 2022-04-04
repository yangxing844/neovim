local ls = require("luasnip")
local s = ls.s
local sn = ls.sn -- snippet node
local t = ls.t -- text_node
local i = ls.i -- insert_node
local c = ls.c -- choice_node
local d = ls.d
-- local pi = ls.parent_indexer
local isn = require("luasnip.nodes.snippet").ISN
-- local psn = require("luasnip.nodes.snippet").PSN
-- local l = require("luasnip.extras").l
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
		t('" }, { t('),
		i(2, "node"),
		t(") }"),
		c(3,{ t(""),t(",{ condition = tex.in_text}"), t(",{ condition = tex.in_mathzone}") }),
		t(")")
	}),

	s("isn2", {
		isn(1, t({ "//This is", "A multiline", "comment" }), "$PARENT_INDENT//"),
	}),

	s("trig", {
		t("text: "),
		i(1),
		t({ "", "copy: " }),
		d(2, function(args)
			-- the returned snippetNode doesn't need a position; it's inserted
			-- "inside" the dynamicNode.
			return sn(nil, {
				-- jump-indices are local to each snippetNode, so restart at 1.
				i(1, args[1]),
			})
		end, { 1 }),
	}),

	s("paren_change", {
		c(1, {
			sn(nil, { t("("), r(1, "user_text"), t(")") }),
			sn(nil, { t("["), r(1, "user_text"), t("]") }),
			sn(nil, { t("{"), r(1, "user_text"), t("}") }),
		}),
	}, {
		stored = {
			user_text = i(1, "default_text"),
		},
	}),
}
