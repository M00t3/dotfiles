-- lsp
require 'lspconfig'.marksman.setup {}

local options = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- keymap('n', "<leader>pc", ":silent !pandoc \"%:p\" -o /tmp/pandoc_output.pdf && notify-send \"pdf created\" <CR>",
--   options)
-- keymap('n', "<leader>ps", ":silent !setsid -f zathura /tmp/pandoc_output.pdf &<CR>", options)
-- keymap('n', "<leader>pm", ":silent !/home/mostafa/.dotfile/my_scripts/.scripts/mdtpdf % <CR>", options)

keymap('n', "<leader>pc",
  ":silent ! ~/.scripts/mdtpdf -i \"%:p\" -o /tmp/pandoc_output.pdf &>/dev/null && notify-send \"pdf created\" || notify-send \"error\" <CR>"
  , options)
keymap('n', "<leader>ps",
  ":silent !setsid -f zathura /tmp/pandoc_output.pdf &<CR>", options)
-- ":silent !zathura /tmp/pandoc_output.pdf & diswon<CR>", options)
keymap('n', "<leader>pm",
  ":silent !touch /tmp/pandoc_output.pdf && ~/.scripts/mdtpdf -i \"%:p\" -o /tmp/pandoc_output.pdf &>/dev/null && sleep 2 &&  setsid -f zathura /tmp/pandoc_output.pdf &<CR>"
  , options)

keymap('n', "<leader>ia", "0i- [ ] <Esc>", options)
keymap('v', "<leader>ia", ":norm 0i- [ ] <CR>", options)

-- open all link in markdown file
keymap('v', '<leader>o', ":w !grep -oE 'http[a-zA-Z0-9./:-]*' |xargs -r firefox<CR>", options)
keymap('n', '<leader>o', ":w !grep -oE 'http[a-zA-Z0-9./:-]*' |xargs -r firefox<CR>", options)

-- set capital latter for headers in markdown
keymap('n', '<leader>[T', ":g/^# \\|^## /. !xargs -r /home/mostafa/.config/lvim/lua/text_process/title.py <CR>",
  { silent = true, desc = "set capital latter for headers" })
