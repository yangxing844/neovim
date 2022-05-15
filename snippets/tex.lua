local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.t
local i = ls.i
local f = ls.f
local c = ls.c
local d = ls.d
local r = ls.r
-- local pi = ls.parent_indexer
-- local isn = require("luasnip.nodes.snippet").ISN
-- local psn = require("luasnip.nodes.snippet").PSN
-- local l = require("luasnip.extras").l
-- local r = require("luasnip.extras").rep
-- local p = require("luasnip.extras").partial
-- local types = require("luasnip.util.types")
-- local events = require("luasnip.util.events")
-- local util = require("luasnip.util.util")
-- local node_util = require("luasnip.nodes.util")
local fmt = require("luasnip.extras.fmt").fmt
local conds = require("luasnip.extras.expand_conditions")
local tex = {}
local function column_count_from_string(descr)
	return #(descr:gsub("[^clm]", ""))
end
local tab = function(args, snip)
	local cols = column_count_from_string(args[1][1])
	if not snip.rows then
		snip.rows = 1
	end
	local nodes = {}
	local ins_indx = 1
	for j = 1, snip.rows do
		table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
		ins_indx = ins_indx + 1
		for k = 2, cols do
			table.insert(nodes, t(" & "))
			table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1)))
			ins_indx = ins_indx + 1
		end
		table.insert(nodes, t({ "\\\\", "" }))
	end
	nodes[#nodes] = t("")
	return sn(nil, nodes)
end
tex.in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex.in_text = function()
	return not tex.in_mathzone()
end
local math = { condition = tex.in_mathzone }
local text = { condition = tex.in_text }
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
local rec_ls2
rec_ls2 = function()
	return sn(nil, {
		c(1, {
			-- important!! Having the sn(...) as the first choice will cause infinite recursion.
			t({ "" }),
			-- The same dynamicNode as in the snippet (also note: self reference).
			sn(nil, { t({ "", "\t\\item[" }), i(1), t("]"), i(2), d(3, rec_ls2, {}) }),
		}),
	})
end

local pinyin = require("pinyin")

local title2label
title2label = function(str)
	local isEnglish = not str[1][1]:find("[^%a%s]")
	local newstr
	if isEnglish then
		newstr = str[1][1]:gsub("(%s)", "_")
	else
		newstr = pinyin(str[1][1], true, "_")
	end
	return newstr
end

return { -- manual snippet
	s({ trig = "pac" }, { t({ "\\usepackage{" }), i(1), t({ "}" }) }, { condition = conds.line_begin }),
	s({ trig = "template" }, {
		t({
			"\\documentclass[a4paper]{amsart}",
			"\\usepackage{textcomp}",
			"\\usepackage{amsmath,amssymb}",
			"\\usepackage{graphix}",
			"\\usepackage{bm}",
			"\\usepackage{siunitx}",
			"\\begin{document}",
			"\t",
		}),
		i(0),
		t({ "", "\\end{document}" }),
	}, { condition = conds.line_begin }),
	s({ trig = "(%s+)(.+)/", regTrig = true, hidden = true }, {
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
	}, math),
	s({ trig = "sum" }, { t("\\sum_{"), i(1), t("}"), t("^{"), i(2), t("} ") }, math),
	s({ trig = "int" }, { t("\\int_{"), i(1), t("}"), t("^{"), i(2), t("} ") }, math),
	s({ trig = "lim" }, { t("\\lim_{"), i(1), t(" to "), i(2), t("} ") }, math),
	s({ trig = "mcal" }, { t("\\mathcal{"), i(1), t("}") }, math),
	s({ trig = "case" }, {
		t({ "\\begin{cases}", "\t" }),
		i(1),
		t({ "", "\\end{cases}" }),
	}, math),
	s("item", {
		c(1, {
			sn(nil, {
				t({ "\\begin{itemize}", "\t\\item " }),
				r(1, "user_text"),
				d(2, rec_ls, {}),
				t({ "", "\\end{itemize}" }),
			}),
			sn(nil, {
				t({ "\\begin{enumerate}", "\t\\item " }),
				r(1, "user_text"),
				d(2, rec_ls, {}),
				t({ "", "\\end{enumerate}" }),
			}),
			sn(nil, {
				t({ "\\begin{description}", "\t\\item[" }),
				r(1, "user_text"),
				t("]"),
				r(2, "user_text2"),
				d(3, rec_ls2, {}),
				t({ "", "\\end{description}" }),
			}),
		}),
	}, { condition = tex.in_text, stored = { user_text = i(1, ""), user_text2 = i(1, "") } }),
	s(
		{ trig = "<([%s%S]+)|", regTrig = true, hidden = true },
		{ t("\\bra{"), f(function(_, snip)
			return snip.captures[1] .. "}"
		end, {}) },
		math
	),

	s(
		{ trig = "|([%s%S]+)>", regTrig = true, hidden = true },
		{ t("\\ket{"), f(function(_, snip)
			return snip.captures[1] .. "}"
		end, {}) },
		math
	),

	s({ trig = "<([%s%S]+)|([%s%S]+)>", regTrig = true, hidden = true }, {
		t("\\braket{"),
		f(function(_, snip)
			return snip.captures[1] .. "}"
		end, {}),
		f(function(_, snip)
			return "{" .. snip.captures[2] .. "}"
		end, {}),
	}, math),

	s({ trig = "<([%s%S]+)(|)([%s%S]+)(|)([%s%S]+)>", regTrig = true, hidden = true, priority = 2000 }, {
		t("\\mel{"),
		f(function(_, snip)
			return snip.captures[1] .. "}"
		end, {}),
		f(function(_, snip)
			return "{" .. snip.captures[3] .. "}"
		end, {}),
		f(function(_, snip)
			return "{" .. snip.captures[5] .. "}"
		end, {}),
	}, math),
	s({ trig = "|([%s%S]+)|", regTrig = true, hidden = true, priority = 2000 }, {
		t("\\abs{"),
		f(function(_, snip)
			return snip.captures[1] .. "}"
		end, {}),
	}, math),

	s({ trig = "lb" }, {
		t("\\label{"),
		c(1, { sn(nil, { i(1, "eq:") }), sn(nil, { i(1, "fig:") }), sn(nil, { i(1, "tab:") }) }),
		i(2),
		t("}"),
	}),
	s(
		{ trig = "dv" },
		{ c(1, { sn(nil, { t("\\dv{"), i(1) }), sn(nil, { t("\\pdv{"), i(1) }) }), t("}{"), i(2), t("}") },
		math
	),
	s({ trig = "num" }, { t("\\num{"), i(1), t("}") }),

	s(
		{ trig = "table" },
		fmt(
			[[
		\begin{table}[<1>]
		    \centering
		    \caption{<2>}
		    \label{tab:<3>}
		    <4>
		\end{table}
		]],
			{ i(1, "htbp"), i(2, "caption"), f(title2label, { 2 }), i(3) },
			{ delimiters = "<>" }
		)
	),
	s(
		"tab",
		fmt(
			[[
\begin{{tabular}}{{{}}}
\toprule
{}
\bottomrule
\end{{tabular}}
]],
			{
				i(1, "c"),
				d(2, tab, { 1 }, {
					user_args = {
						-- Pass the functions used to manually update the dynamicNode as user args.
						-- The n-th of these functions will be called by dynamic_node_external_update(n).
						-- These functions are pretty simple, there's probably some cool stuff one could do
						-- with `ui.input`
						function(snip)
							snip.rows = snip.rows + 1
						end,
						-- don't drop below one.
						function(snip)
							snip.rows = math.max(snip.rows - 1, 1)
						end,
					},
				}),
			}
		)
	),
	s(
		"fig",
		fmt(
			[[
		\begin{figure}[<1>]
		    \centering
		    \includegraphics[width=<2>\linewidth]{<3>}
		    \caption{<4>}
		    \label{fig:<5>}
		\end{figure}
		]],
			{ i(1, "htbp"), i(2, "0.8"), i(3, "path_to_figure"), i(4, "caption"), f(title2label, { 4 }) },
			{ delimiters = "<>" }
		)
	),

	s({ trig = "sec" }, {
		c(1, {
			sn(nil, { t("\\section{"), r(1, "user_text"), t({ "}", "\\label{sec:" }), f(title2label, { 1 }), t("}") }),
			sn(nil, { t("\\chapter{"), r(1, "user_text"), t({ "}", "\\label{cha:" }), f(title2label, { 1 }), t("}") }),
		}),
	}, { condition = tex.in_text, user_text = i(1, "name") }),
},
	{
		s({ trig = "sin" }, { t("\\sin") }, math),
		s({ trig = "cos" }, { t("\\cos") }, math),
		s({ trig = "cot" }, { t("\\cot") }, math),
		s({ trig = "csc" }, { t("\\csc") }, math),
		s({ trig = "ln" }, { t("\\ln") }, math),
		s({ trig = "log" }, { t("\\log") }, math),
		s({ trig = "exp" }, { t("\\exp") }, math),
		s({ trig = "tan" }, { t("\\tan") }, math),
		s({ trig = "arcsin" }, { t("\\arcsin") }, math),
		s({ trig = "arccos" }, { t("\\arccos") }, math),
		s({ trig = "arccot" }, { t("\\arccot") }, math),
		s({ trig = "arccsc" }, { t("\\arccsc") }, math),
		s({ trig = "ln" }, { t("\\ln") }, math),
		s({ trig = "log" }, { t("\\log") }, math),
		s({ trig = "exp" }, { t("\\exp") }, math),

		s({ trig = "([a-zA-Z}]+)%.([0-9a-zA-Z])", regTrig = true, hidden = true }, {
			f(function(_, snip)
				return snip.captures[1] .. "_"
			end, {}),
			f(function(_, snip)
				return snip.captures[2]
			end, {}),
		}, math),

		s({ trig = "([a-zA-Z}]+)([0-9])", regTrig = true, hidden = true }, {
			f(function(_, snip)
				return snip.captures[1] .. "^"
			end, {}),
			f(function(_, snip)
				return snip.captures[2]
			end, {}),
		}, math),

		s({ trig = "dm" }, {
			c(1, {
				sn(nil, { t({ "\\[", "\t" }), r(1, "user_text"), t({ "", "\\]" }) }),
				sn(nil, { t({ "\\begin{equation}", "\t" }), r(1, "user_text"), t({ "", "\\end{equation}" }) }),
				sn(nil, {
					t({ "\\begin{equation}\\label{eq:" }),
					i(1),
					t({ "}", "\t" }),
					r(2, "user_text"),
					t({ "", "\\end{equation}" }),
				}),
			}),
		}, { condition = tex.in_text, stored = {
			user_text = i(1, ""),
		} }),
		s({ trig = "jk", wordTrig = false }, { t("^{"), i(1), t("}") }),
		s({ trig = "fd", wordTrig = false }, { t("_{"), i(1), t("}") }),
		s({ trig = "==" }, { t("&=") }, math),
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
		s({ trig = "mk" }, { t("\\("), i(1), t({ "\\)" }) }),
		s({ trig = "sq" }, { t("\\sqrt{"), i(1), t("}") }, math),
		s(
			{ trig = "(\\[a-zA-Z]*)%^", regTrig = true, hidden = true },
			{ t({ "\\hat{" }), f(function(_, snip)
				return snip.captures[1] .. "}"
			end, {}) },
			math
		),
		s(
			{ trig = "(\\?%w+)(,%.)", regTrig = true, hidden = true },
			{ t("\\symbfit{"), f(function(_, snip)
				return snip.captures[1] .. "}"
			end, {}) },
			math
		),
	}
