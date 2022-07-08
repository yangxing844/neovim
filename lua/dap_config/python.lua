local M = {}

function M.setup()
	require("dap-python").setup('/usr/bin/python')
end
return M
