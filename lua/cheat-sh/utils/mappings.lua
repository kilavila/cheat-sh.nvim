local _mappings = {}

_mappings.normal = {
	["<cr>"] = "run_search()",
	["q"] = "close_search()",
	["<esc>"] = "close_search()",
}
_mappings.insert = {
	["<cr>"] = "run_search()",
}

_mappings.set = function(buf)
	for k, v in pairs(_mappings.insert) do
		vim.api.nvim_buf_set_keymap(
			buf,
			"i",
			k,
			'<esc>:lua require("cheat-sh").' .. v .. "<cr>",
			{ nowait = true, noremap = true, silent = true }
		)
	end

	for k, v in pairs(_mappings.normal) do
		vim.api.nvim_buf_set_keymap(
			buf,
			"n",
			k,
			':lua require("cheat-sh").' .. v .. "<cr>",
			{ nowait = true, noremap = true, silent = true }
		)
	end
end

return _mappings
