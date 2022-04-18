local normal_compile = "g++ % && ./a.out"
local make_compile = "make -C build run"
local cmake_compile = "cmake build && make -C build run"
local cwd = vim.fn.expand("%:h")

local function file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local function run_command()
	if file_exists(cwd .. "/makefile") then
		return make_compile
	elseif file_exists(cwd .. "/CMakeLists.txt") then
		return cmake_compile
	else
		return normal_compile
	end
end
