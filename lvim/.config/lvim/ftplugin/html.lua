local options = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- run browser for live editting html file
keymap('n', "<leader>P", ":silent !$HOME/.config/lvim/lua/scripts/run_browser/main.sh %:p <CR>", options)
