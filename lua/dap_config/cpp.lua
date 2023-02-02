local M = {}

function M.setup()
	-- 💀 Adjust the path to your executable
	local cmd = "/usr/bin/codelldb"

	local dap = require("dap")

	dap.adapters.codelldb = function(on_adapter)
		-- This asks the system for a free port
		local tcp = vim.loop.new_tcp()
		tcp:bind("127.0.0.1", 0)
		local port = tcp:getsockname().port
		tcp:shutdown()
		tcp:close()

		-- Start codelldb with the port
		local stdout = vim.loop.new_pipe(false)
		local stderr = vim.loop.new_pipe(false)
		local opts = {
			stdio = { nil, stdout, stderr },
			args = { "--port", tostring(port), "--params", '{"showDisassembly":"never"}' },
		}
		local handle
		local pid_or_err
		handle, pid_or_err = vim.loop.spawn(cmd, opts, function(code)
			stdout:close()
			stderr:close()
			handle:close()
			if code ~= 0 then
				print("codelldb exited with code", code)
			end
		end)
		if not handle then
			vim.notify("Error running codelldb: " .. tostring(pid_or_err), vim.log.levels.ERROR)
			stdout:close()
			stderr:close()
			return
		end
		vim.notify("codelldb started. pid=" .. pid_or_err)
		stderr:read_start(function(err, chunk)
			assert(not err, err)
			if chunk then
				vim.schedule(function()
					require("dap.repl").append(chunk)
				end)
			end
		end)
		local adapter = {
			type = "server",
			host = "127.0.0.1",
			port = port,
		}
		vim.defer_fn(function()
			on_adapter(adapter)
		end, 500)
	end

	dap.adapters.codelldb_default_port = {
		type = "server",
		host = "127.0.0.1",
		port = 13000,
	}

	dap.adapters.lldb = {
		type = "executable",
		command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
		name = "lldb",
	}

	dap.configurations.cpp = {
		{
			name = "Launch",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/.bin/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {},
		},
		{
			name = "Launch_lldb",
			type = "lldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/.bin/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {}, -- executable args
		},
	}
	-- If you want to use this for Rust and C, add something like this:

	dap.configurations.c = dap.configurations.cpp
	dap.configurations.rust = dap.configurations.cpp
end

return M
