--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
lvim.keys.normal_mode["<Leader><S-F>"] = ":RnvimrToggle<CR>"


-- my configs
reload("user.settings")
reload("user.keymaps")
reload("user.autorun")
reload("user.user_plugins")
reload("user.plugin_configs")
reload("user.lsp_formater_linter")


vim.cmd([[
let g:user_emmet_mode='i'  "enable all functions, which is equal to
let g:user_emmet_leader_key=','
]])

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"

lvim.colorscheme = "rose-pine-main"
-- lvim.builtin.lualine.style = "lvim"
-- lvim.builtin.lualine.options.theme = "dracula"


-- lvim.lsp.diagnostics.virtual_text = false
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"



lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}

-- keymap("n", "<Leader>tc", ":Gitsigns setqflist<CR>", options)
lvim.builtin.which_key.mappings["tc"] = {
  "<cmd>Gitsigns setqflist<CR>", "git changes"
}

-- lvim.builtin.which_key.mappings["1"] = {
--   name = "ChatGPT",
--   c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
--   e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
--   g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
--   t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
--   k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
--   d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
--   a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
--   o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
--   s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
--   f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
--   x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
--   r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
--   l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
-- }

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.keys.normal_mode = {
  ["<leader><leader>s"] =
  ":source ~/.local/share/lunarvim/site/pack/packer/start/null-ls.nvim/lua/null-ls/builtins/completion/luasnip.lua <CR>",
  ["<C-s>"] = ":w<cr>",
  -- ["<g-/>"] = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
}


----------------------
-- my edit
-- local cmp = require 'cmp'
-- lvim.builtin.cmp.mapping["<ESC>"] = cmp.mapping(function(fallback)
--   cmp.close()
--   fallback()
-- end)

-- lvim.builtin.cmp.mapping["<C-l>"] = cmp.mapping(function(fallback)
--   if cmp.visible() then
--     local confirm_opts = vim.deepcopy(lvim.builtin.cmp.confirm_opts) -- avoid mutating the original opts below
--     local is_insert_mode = function()
--       return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
--     end
--     if is_insert_mode() then -- prevent overwriting brackets
--       confirm_opts.behavior = ConfirmBehavior.Insert
--     end
--     if cmp.confirm(confirm_opts) then
--       return -- success, exit early
--     end
--   end
--   fallback() -- if not exited early, always fallback
-- end)
----------------------

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

----------
-- python debuger config
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

-- codi ai
-- require('sg').setup()
-- -- Sourcegraph configuration. All keys are optional
-- require("sg").setup {
--   -- Pass your own custom attach function
--   --    If you do not pass your own attach function, then the following maps are provide:
--   --        - gd -> goto definition
--   --        - gr -> goto references
--   on_attach = your_custom_lsp_attach_function
-- }


-- debuger keybinds
lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>",
  "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
  "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = {
  "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }
