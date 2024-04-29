local formatters = require "lvim.lsp.null-ls.formatters"

formatters.setup {
  {
    name = "black",
    filetype = { "python" }
  },
  {
    name = "djlint",
    filetype = "htmldjango"
  },
  {
    name = "shfmt",
    filetype = "bash"
  },
  {
    name = "prettier",
    filetype = { "javascript" }
  },
  {
    name = "markdownlint",
    filetype = { "markdown" }
  },
}


local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  { name = "shellcheck" },
  {
    name = "markdownlint",
    filetype = { "markdown" }
  },
  {
    name = "codespell",
    filetypes = { "javascript", "python" },
  },
  -- {
  --   name = "pylint",
  --   filetypes = { "python" },
  -- },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    name = "proselint"
  },
}
