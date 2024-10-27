local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

vim.keymap.set('n', '<C-p>', builtin.find_files, {})

-- live grep on current working directory
vim.keymap.set("n", "<C-f>", function()
	builtin.live_grep({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
  })
end)
