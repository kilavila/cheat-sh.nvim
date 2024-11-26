local _http = require("cheat-sh.utils.http")
local _mappings = require("cheat-sh.utils.mappings")

local M = {}

local url = "https://cheat.sh/"
local url_params = "?qT"

M.search = function()
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, true, {})

	local cur_win = vim.api.nvim_get_current_win()
	local cur_win_conf = vim.api.nvim_win_get_config(cur_win)

	local win_width = 75
	if win_width > (cur_win_conf.width - 10) then
		win_width = cur_win_conf.width - 10
	end
	local win_top = math.floor(cur_win_conf.height / 2)
	local win_left = math.floor((cur_win_conf.width - win_width) / 2)
	if win_width > (cur_win_conf.width - 10) then
		win_left = 5
	end

	local opts = {
		relative = "win",
		width = win_width,
		height = 1,
		col = win_left,
		row = win_top,
		anchor = "NW",
		style = "minimal",
		border = { "🯄", "━", "┓", "┃", "┛", "━", "┗", "┃" },
	}

	vim.api.nvim_open_win(buf, true, opts)
	_mappings.set(buf)
	vim.cmd("startinsert")
end

M.run_search = function()
	local cur_line = vim.api.nvim_get_current_line()
	local cur_win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_close(cur_win, true)

	local data = _http.get(url .. cur_line .. url_params)
	local cheatsheet = {}
	for line in string.gmatch(data, "[^\r\n]+") do
		table.insert(cheatsheet, line)
	end

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, cheatsheet)

	vim.api.nvim_open_win(buf, true, {
		split = "right",
		win = 0,
	})

	if string.find(cur_line, "/") then
		local cur_line_table = {}
		for word in string.gmatch(cur_line, "([a-zA-Z0-9]+)") do
			table.insert(cur_line_table, word)
		end
		vim.cmd("set filetype=" .. cur_line_table[1])
	else
		vim.cmd("set filetype=sh")
	end
end

return M
