local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.t
local i = ls.i
local f = ls.f
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
local conds = require("luasnip.extras.expand_conditions")
local tex = {}

local function VISUAL(args, snip)
	return snip.env.SELECT_RAW
end
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
-- manual snippet
return {
	s({ trig = "->", wordTrig = false }, t({ "\\rightarrow" }), { condition = tex.in_mathzone }),
	s({ trig = "=>", wordTrig = false, desc = "implies symbol" }, t({ "\\implies" }), { condition = tex.in_mathzone }),
	s({ trig = "<-", wordTrig = false }, t({ "\\leftarrow" }), { condition = tex.in_mathzone }),
	s({ trig = "pac" }, { t({ "\\usepackage{" }), i(1), t({ "}" }) }, { condition = conds.line_begin }),
	s({ trig = "template" }, {
		t({
			"\\documentclass[a4paper]{amsart}",
			"\\usepackage{textcomp}",
			"\\usepackage{amsmath,amssymb}",
			"\\usepackage{graphics}",
			"\\usepackage{bm}",
			"\\usepackage{siunitx}",
			"\\begin{document}",
			"\t",
		}),
		i(0),
		t({ "", "\\end{document}" }),
	}, { condition = conds.line_begin }),
	s({ trig = "(%s+)(.+)/", regTrig = true }, {
		f(function(_, snip)
			return snip.captures[1]
		end, {}),
		t("\\frac{"),
		f(function(_, snip)
			return snip.captures[2]
		end, {}),
		t("}{"),
		i(1),
		t({ "}" }),
	}, { condition = tex.in_mathzone }),
	s({ trig = "sum" }, { t("\\sum_{"), i(1), t("}"), t("^{"), i(2), t("} ") }, { condition = tex.in_mathzone }),
	s({ trig = "int" }, { t("\\int_{"), i(1), t("}"), t("^{"), i(2), t("} ") }, { condition = tex.in_mathzone }),
	s({ trig = "lim" }, { t("\\lim_{"), i(1), t(" to "), i(2), t("} ") }, { condition = tex.in_mathzone }),
	s({ trig = "mcal" }, { t("\\mathcal{"), i(1), t("}") }, { condition = tex.in_mathzone }),
	s({ trig = "case" }, {
		t({ "\\begin{cases}", "\t" }),
		i(1),
		t({ "", "\\end{cases}" }),
	}, { condition = tex.in_mathzone }),
	s("item", {
		t({ "\\begin{itemize}", "\t\\item " }),
		i(1),
		d(2, rec_ls, {}),
		t({ "", "\\end{itemize}" }),
		i(0),
	}, { condition = tex.in_text }),
},
		-- autosnippet
{
		s({ trig = "sin" }, { t("\\sin") }, { condition = tex.in_mathzone }),
		s({ trig = "cos" }, { t("\\cos") }, { condition = tex.in_mathzone }),
		s({ trig = "cot" }, { t("\\cot") }, { condition = tex.in_mathzone }),
		s({ trig = "csc" }, { t("\\csc") }, { condition = tex.in_mathzone }),
		s({ trig = "ln" }, { t("\\ln") }, { condition = tex.in_mathzone }),
		s({ trig = "log" }, { t("\\log") }, { condition = tex.in_mathzone }),
		s({ trig = "exp" }, { t("\\exp") }, { condition = tex.in_mathzone }),
		s({ trig = "tan" }, { t("\\tan") }, { condition = tex.in_mathzone }),

		s({ trig = "arcsin" }, { t("\\arcsin") }, { condition = tex.in_mathzone }),
		s({ trig = "arccos" }, { t("\\arccos") }, { condition = tex.in_mathzone }),
		s({ trig = "arccot" }, { t("\\arccot") }, { condition = tex.in_mathzone }),
		s({ trig = "arccsc" }, { t("\\arccsc") }, { condition = tex.in_mathzone }),
		s({ trig = "ln" }, { t("\\ln") }, { condition = tex.in_mathzone }),
		s({ trig = "log" }, { t("\\log") }, { condition = tex.in_mathzone }),
		s({ trig = "exp" }, { t("\\exp") }, { condition = tex.in_mathzone }),
		s({ trig = "([a-zA-Z}])%.([0-9a-zA-Z])", regTrig = true }, {

			f(function(_, snip)
				return snip.captures[1] .. "_"
			end, {}),
			t("{"),
			f(function(_, snip)
				return snip.captures[2] .. "}"
			end, {}),
		}, { condition = tex.in_mathzone }),

		s({ trig = "([a-zA-Z}])([0-9])", regTrig = true }, {
			f(function(_, snip)
				return snip.captures[1] .. "^"
			end, {}),
			t("{"),
			f(function(_, snip)
				return snip.captures[2] .. "}"
			end, {}),
		}, { condition = tex.in_mathzone }),

		s({ trig = "dm" }, { t({ "\\[", "\t" }), i(1), t({ "", "\\]" }) }, { condition = tex.in_text }),
		s({ trig = "jk", wordTrig = false }, { t("^{"), i(1), t("}") }),
		s({ trig = "fd", wordTrig = false }, { t("_{"), i(1), t("}") }),
		s({ trig = "==" }, { t("&=") }, { condition = tex.in_mathzone }),
		s({ trig = "beg" }, {
			t({ "\\begin{" }),
			i(1),
			t({ "}", "\t" }),
			i(2),
			t({ "", "\\end{" }),
			f(function(args, _)
				return args[1]
			end, { 1 }),
			t({ "}" }),
		}, { condition = conds.line_begin }),
		s({ trig = "mk" }, { t("$"), i(1), t({ "$" }) }),
		s({ trig = "sq" }, { t("\\sqrt{"), i(1), t("}") }, { tex.in_text }),
	}
