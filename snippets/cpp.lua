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
					return snip.env.CURRENT_MONTH_NAME .. " " .. snip.env.CURRENT_DATE .. "of" .. snip.env.CURRENT_YEAR
				end, {}),
				i(2),
			}
		)
	),
}
