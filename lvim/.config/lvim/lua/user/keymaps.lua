local keymap = vim.api.nvim_set_keymap
local create_command = vim.api.nvim_create_user_command
local options = { noremap = true, silent = true }

-- set leader key (by default is \)
vim.cmd([[
:let mapleader = "\<Space>"
]]
)

-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"


-- max the window
keymap("n", "<leader>m", ":MaximizerToggle!<CR>", options)

-- jomp list
keymap("n", "<Leader>j", ":cnext<CR>", options)
keymap("n", "<Leader>k", ":cprevious<CR>", options)
keymap("n", "<Leader><S-k>", ":copen<CR>", options)

--  git dif
keymap("n", "<Leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", options)
keymap("n", "<Leader>gh", ":diffget //2<CR>", options)
keymap("v", "<Leader>gl", ":diffget //3<CR>", options)
keymap("v", "<Leader>gh", ":diffget //2<CR>", options)

-- shortcut for hunk in git
keymap("v", "<Leader>gr", ":Gitsigns reset_hunk<CR>", options)
keymap("v", "<Leader>gs", ":Gitsigns stage_hunk<CR>", options)
keymap("v", "<Leader>gu", ":Gitsigns undo_stage_hunk<CR>", options)


--  run command with sentense in vim
keymap("v", "<Leader><S-r>", ":w ! xargs -I{} bash -c \"{}\"<CR>", options)

--  select all content
keymap("n", "<leader><S-v>", "ggVG", options)

--  spell check
keymap("n", "<f10>", ":setlocal spell! spelllang=en_us<CR>; :echo 'spelling toggled'<CR>", options)
keymap("n", "<Leader><S-m>", ":Maps<CR>", options)

--  cd to directory of file
keymap("n", "<Leader>%", ": lcd %:p:h<CR>",
  { silent = false, desc = "cd into current file directory" })

-- open all link on firefox
keymap("n", "<Leader>[u", ":silent! !grep -oiaE \"https?://[^()\\\"\\\'> ]+\" %  |xargs -r firefox <CR>",
  { silent = true, desc = "open all link in firefox" })
-- |xargs -r firefox "
keymap("v", "<Leader>[u", ":silent! w !grep -oiaE \"https?://[^()\\\"\\\'> ]+\" |xargs -r  firefox<CR>",
  { silent = true, desc = "open all link in firefox" })

keymap("n", "<Leader>[U", ":silent! ! grep -oiaE \"https?://[^()\\\"\\\'> ]+\" % |rofi-f |xargs -r firefox<CR>",
  { silent = true, desc = "open one link with roif in firefox" })

-- gx command replase
keymap("n", "gx", " viW\"ay :silent! !setsid -f xdg-open \"<C-R>a\" &<CR>", options)

--  yank to end of line
keymap("n", "<S-y>", "y$", options)

--  copy to clipboard
keymap("n", "<C-y>", "\"+y", options)
keymap("v", "<C-y>", "\"+y", options)

--  paste from clipboard
keymap("n", "<C-p>", "o<Esc>\"+p", options)
--  nnoremap <C-p> "+p
keymap("v", "<C-p>", "\"+p", options)

--  select all
keymap("n", "<Leader>J", "ggVGJ", options)

--  delete all
keymap("n", "<Leader><S-d>", "ggVGd", options)

--  reaname word in all the file
keymap("n", "<Leader>R", "viwy:%s/\\c\\<<C-r>\"\\>//gc<Left><Left><Left>",
  { silent = true, desc = "change word in this buffer" })
keymap("v", "<Leader>R", "y:%s/\\c\\<<C-r>\"\\>//gc<Left><Left><Left>",
  { silent = true, desc = "change word in this buffer" })

--  sort table
keymap("v", "<Leader>-", ":!column -t<CR>", options)

-- Better nav for omnicomplete
keymap("i", "<expr>", "<c-j> (\"<C-n>\")", options)
keymap("i", "<expr>", "<c-k> (\"<C-p>\")", options)

--  TAB in general mode will move to text buffer
keymap("n", "<TAB>", ":bnext<CR>", options)

--  SHIFT-TAB will go back
keymap("n", "<S-TAB>", ":bprevious<CR>", options)

--  TAB in general mode will move to text buffer
keymap("n", "<s-l>", ":bnext<CR>", options)

--  SHIFT-TAB will go back
keymap("n", "<S-h>", ":bprevious<CR>", options)

--  easy quit from insert mode
keymap("i", "<C-c>", "<Esc>", options)

--  Alternate way to save
keymap("n", "<C-s>", ":w<CR>", options)

--  Use control-c instead of escape
keymap("n", "<C-c>", "<Esc>", options)

--  <TAB>: completion.
keymap("i", "<expr><TAB>", "pumvisible() ? \"<C-n>\" : \"<TAB>\"", options)

--  Better tabbing
keymap("v", "<", "<gv", options)
keymap("v", ">", ">gv", options)

--  Better window navigation
keymap("n", "<C-h>", "<C-w>h", options)
keymap("n", "<C-j>", "<C-w>j", options)
keymap("n", "<C-k>", "<C-w>k", options)
keymap("n", "<C-l>", "<C-w>l", options)

keymap("n", "<leader>y", "ggVG\"+y",
  { silent = true, desc = "copy into system clipboard" })

-- convert text for title
keymap("n", "<Leader>[t", "V: !xargs -r ~/.config/lvim/lua/text_process/title.py <CR>",
  { silent = true, desc = "capital first laters" })
keymap("v", "<Leader>[t", ": !xargs -I{} ~/.config/lvim/lua/text_process/title.py \"{}\" <CR>",
  { silent = true, desc = "capital True laters" })

-- create border
keymap("n", "<leader>[b", "I|  <Esc>A  |<Esc>yyPVr-0r+$r+jpVr-0r+$r+k", { desc = "create border" })

--  close all buffer except that you are in
create_command("BufOnly",
  "execute '%bdelete|edit #|normal `\"'",
  { nargs = 0 }
)

keymap("n", "<leader><s-q>", ":BufOnly <CR>", options)

--  ### F keys ###
--  z= for change word!
--  spell check
keymap("n", "<F7>", ":setlocal spell!  spelllang=en_us<CR>", options)

-- run scripts with compiler script
keymap("n", "<leader><CR>", ":TermExec cmd=\"compiler %\"<CR>",
  { silent = true, desc = "run script" })

keymap("n", "<leader>[e", ":norm oexit()",
  { silent = true, desc = "exit from app" })
--

-- breakpoint condition for dap debuger
vim.keymap.set("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Break point condition: '))<CR>")

create_command("RunScript",
  function()
    vim.cmd(':<Cmd>ToggleTerm<CR>')
    vim.cmd(':FloatermSend --name=run compiler ' .. vim.cmd("bufname('#')"))
  end,
  { nargs = 0 }
)

--  unbind visual mode
keymap("n", "<S-q>", ":!echo unbind visual mode<CR>", options)

-- telescope
keymap('n', "<leader>s;", "<CMD>Telescope command_history<CR>", options)

keymap("n", "<leader>s<s-p>", "<CMD>Telescope projects<CR>", options)
keymap("n", "<leader>sB",
  "<CMD>:lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy({}))<CR>",
  options)
keymap("n", "<M-/>",
  "<CMD>:lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_ivy({}))<CR>",
  options)

keymap("n", "<leader>sq", ":lua require('telescope.builtin').quickfix(require('telescope.themes').get_ivy({}))<CR>",
  options)

keymap("n", "<leader>sw",
  ":lua require('telescope.builtin').grep_string{shorten_path = true, word_match= '-w', only_sort_text = true, search = '' } <CR>"
  ,
  options)
keymap("n", "<leader>L;",
  ":lua require('telescope.builtin').find_files({cwd=\"~/.config/lvim\"})<CR>"
  ,
  options)


-- scroll up and down
keymap('n', "<C-u>", "<C-u>zz", options)
keymap('n', "<C-d>", "<C-d>zz", options)

keymap('n', "<leader><leader>S", ":source $HOME/.config/lvim/config.lua <CR>", options)
keymap('n', "<leader><leader>l",
  "<cmd>source ~/.local/share/lunarvim/site/pack/packer/start/null-ls.nvim/lua/null-ls/builtins/completion/luasnip.lua <CR>"
  , options)
-- disable autopirs
keymap('n', "<leader><leader>pd", ":lua require('nvim-autopairs').disable() <CR>", options)
keymap('n', "<leader><leader>pe", ":lua require('nvim-autopairs').enable() <CR>", options)

-- show in vscodium
-- keymap('n', "<leader><leader>g", ":silent !setsid -f codium % <CR>", options)
keymap('n', "<leader><leader>g", ":silent !setsid -f code % <CR>", options)


keymap('n', "<leader>Z", ":Goyo <CR>", options)

-- checkbox
keymap('n', "<leader>it", ":ChecklistToggleCheckbox<CR>", options)
keymap('n', "<leader>ie", ":ChecklistEnableCheckbox<CR>", options)
keymap('n', "<leader>id", ":ChecklistDisableCheckbox<CR>", options)
keymap('v', "<leader>it", ":ChecklistToggleCheckbox<CR>", options)
keymap('v', "<leader>ie", ":ChecklistEnableCheckbox<CR>", options)
keymap('v', "<leader>id", ":ChecklistDisableCheckbox<CR>", options)

-- command line moving
vim.cmd([[
cmap <A-h> <S-Left>
cmap <A-l> <S-Right>
cmap <A-j> <Down>
cmap <A-k> <Up>
cmap <C-j> <S-Down>
cmap <C-k> <S-Up>
nmap  <M-j> :resize -2<CR>
nmap  <M-k> :resize +2<CR>
nmap  <M-h> :vertical resize -2<CR>
nmap  <M-l> :vertical resize +2<CR>
]])
