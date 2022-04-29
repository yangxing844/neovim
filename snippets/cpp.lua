return {
	s(
		"head",
		fmt(
			[[
/******************************************************************************
 * File:             {}
 *
 * Author:           {}
 * Created:          {}
 * Description:      {}
 *****************************************************************************/
	]],
			{
				f(function(_, snip)
					return snip.env.TM_FILENAME
				end, {}),
				i(1),
				f(function(_, snip)
					return snip.env.CURRENT_MONTH_NAME
						.. " "
						.. snip.env.CURRENT_DATE
						.. " of "
						.. snip.env.CURRENT_YEAR
				end, {}),
				i(2),
			}
		)
	),
	s(
		"sep",
		fmt(
			[[
std::cout<<"\n\n******************************** "
<<"{}"<<" ********************************\n\n";
	]],
			{
				i(1),
			}
		)
	),
	s("inc", t("#include <"), i(1)),

	s(
		"main",
		fmt(
			[[
	int main(int argc, char const *argv[])
	{
		<>
		return 0;	
	}
	]],
			{ i(1) },
			{ delimiters = "<>" }
		)
	),

	s("class", {
		-- Choice: Switch between two different Nodes, first parameter is its position, second a list of nodes.
		c(1, {
			t("public "),
			t("private "),
		}),
		t("class "),
		i(2),
		t(" "),
		c(3, {
			t("{"),
			-- sn: Nested Snippet. Instead of a trigger, it has a position, just like insert-nodes. !!! These don't expect a 0-node!!!!
			-- Inside Choices, Nodes don't need a position as the choice node is the one being jumped to.
			sn(nil, {
				t("extends "),
				-- restoreNode: stores and restores nodes.
				-- pass position, store-key and nodes.
				r(1, "other_class", i(1)),
				t(" {"),
			}),
			sn(nil, {
				t("implements "),
				-- no need to define the nodes for a given key a second time.
				r(1, "other_class"),
				t(" {"),
			}),
		}),
		t({ "", "\t" }),
		i(0),
		t({ "", "}" }),
	}),

	s(
		"fn",
		fmt(
			[[
	<1> <2>(<3>)
	{
		<4>
	}
	]],
			{
				i(1, "void"),
				i(2, "function"),
				i(3),
				i(4),
			},
			{ delimiters = "<>" }
		)
	),

	s(
		"if",
		fmt(
			[[
	if (<1>)
	{
		<2>
	}
	]],
			{
				i(1, "condition"),
				i(2),
			},
			{ delimiters = "<>" }
		)
	),
	-- TODO:  if else,elseif choice node, for-loop
}
