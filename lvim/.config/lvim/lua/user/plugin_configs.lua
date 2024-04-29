require("plug-conf.luasnip")
require("plug-conf.maximizer")
require("plug-conf.ranger")
require("plug-conf.ts-rainbow")
require("plug-conf.vim-checklist")
require("plug-conf.emmet")
require("plug-conf.ranger")


local dap = require("dap")
dap.configurations.python = {
  {
    type = "debugpy",
    request = "launch",
    program = "${workspaceFolder}/manage.py",
    name = "Django runserver",
    args = { "runserver", "1212" }
  },
}


lvim.builtin.dap.active = true
-- load my snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/lvim/snippets" })
require("luasnip.loaders.from_snipmate").load({ paths = "~/.config/lvim/snippets" })

lvim.builtin.treesitter.rainbow.enable = true

-- for show values of variable
require("nvim-dap-virtual-text").setup()

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "frecency")
  pcall(telescope.load_extension, "neoclip")
  pcall(telescope.load_extension, "project")
  pcall(telescope.load_extension, "fzf-native")
end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "css",
  "yaml",
  -- "typescript",
  -- "tsx",
  -- "rust",
  -- "java",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.builtin.project.manual_mode = true
lvim.builtin.project.detection_methods = { "lsp", "pattern" }
