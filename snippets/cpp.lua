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
		"leetcode",
		fmt(
			[[
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
class Solution {{
    public:
}};
int main(int argc, char const *argv[])
{{
	vector<int> sample{{}};
	return 0;
}}

		]],
			{}
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
			{ i(0) },
			{ delimiters = "<>" }
		)
	),

	s(
		"class",
		fmt(
			[[ class <> {
		public:
			<>
			<>() = default;
			virtual ~<> ();
		private: 
			<>
		};]],

			{
				i(1),
				f(function(args, snip)
					return args[1][1]
				end, { 1 }),
				i(2),
				f(function(args, snip)
					return args[1][1]
				end, { 1 }),
				i(3),
			},
			{ delimiters = "<>" }
		)
	),

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
