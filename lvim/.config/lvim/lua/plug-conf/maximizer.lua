local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }
keymap("n", "<leader>m", ":MaximizerToggle!<CR>", options)
