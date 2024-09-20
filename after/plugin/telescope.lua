local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- live grep on current working directory
vim.keymap.set("n", "<C-f>", function()
	builtin.live_grep({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
  })
end)
