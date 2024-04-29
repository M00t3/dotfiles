-- Additional Plugins
lvim.plugins = {
  -- colorschemes
  { "catppuccin/nvim",       name = "catppuccin", priority = 1000 },
  { "rebelot/kanagawa.nvim" },
  { "EdenEast/nightfox.nvim" },
  { 'rose-pine/neovim',      name = 'rose-pine' },
  { 'navarasu/onedark.nvim' },
  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      vim.cmd([[colorscheme aura-dark]])
    end
  },
  { "lunarvim/colorschemes" },
  -- checkbox for markdown
  { 'michaeljsmith/vim-indent-object' },

  { "jaredgorski/spacecamp" },
  -- { "folke/tokyonight.nvim" },
  { "matsuuu/pinkmare" },
  { "drewtempelmeyer/palenight.vim" },
  { "roosta/srcery" },
  { "benjaminjamesxyz/DarkModeReloaded" },
  { "jonstoler/werewolf.vim" },
  { "nanotech/jellybeans.vim" },
  { "benjaminjamesxyz/BackToTheFuture" },
  { 'dracula/vim',                      arg = { name = 'dracula' } },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },

  { 'junegunn/goyo.vim' },


  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },


  -- navigation
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  { "kevinhwang91/rnvimr" },
  { "tpope/vim-dadbod" },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },

  {
    "tpope/vim-surround",
    -- keys = { "c", "d", "y" },
    -- -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- init = function()
    --   vim.o.timeoutlen = 500
    -- end
  },


  -- git
  { "mattn/webapi-vim" },
  {
    "mattn/vim-gist",
    event = "BufRead",
    dependencies = "mattn/webapi-vim",
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },

  { 'mg979/vim-visual-multi' },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },

  {
    "pwntester/octo.nvim",
    event = "BufRead",
  },

  -- take screenshot from code
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        -- Configuration here, or leave empty to use defaults
        font = "Hack=33;Noto Color Emoji=34"
      })
    end,
    theme = "gruvbox-dark",
  },

  -- html tags
  { "mattn/emmet-vim" },


  -- Treesitter
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = {
          -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },
  -- { import = "plugins" },
  {
    "p00f/nvim-ts-rainbow"
  },
  {
    "nvim-treesitter/playground",
    event = "BufRead",
  },
  { 'mfussenegger/nvim-dap-python' },
  { "theHamsta/nvim-dap-virtual-text" },
  { "evansalter/vim-checklist" },

  { "nvim-neotest/neotest" },
  { "nvim-neotest/nvim-nio" },
  {
    "nvim-neotest/neotest-python"
  },
  ----- end

  -- Telescope
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    event = "BufRead",
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  --  LSP Enhancement
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120,              -- Width of the floating window
        height = 25,              -- Height of the floating window
        default_mappings = false, -- Bind default mappings
        debug = false,            -- Print debug information
        opacity = nil,            -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil      -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" init option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]] },

    -- If you have a recent version of lazy.nvim, you don't need to add this!
    -- build = "nvim -l build/init.lua",
  },


  { "tpope/vim-repeat" },
  { "tpope/vim-speeddating" },
  { "tpope/vim-eunuch" },

  -- todo comment
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    lazy = true,
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  -- ai
  -- copilot
  { "github/copilot.vim" },

  -- {
  --   "zbirenbaum/copilot-cmp",
  --   event = "InsertEnter",
  --   dependencies = { "zbirenbaum/copilot.lua" },
  --   config = function()
  --     vim.defer_fn(function()
  --       require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
  --       require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
  --     end, 100)
  --   end,
  -- },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-lua/plenary.nvim" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VeryLazy",
    opts = {
      debug = true,
      show_help = "yes",
      prompts = {
        Explain = "Explain how it works.",
        Review = "Review the following code and provide concise suggestions.",
        Tests = "Briefly explain how the selected code works, then generate unit tests.",
        Refactor = "Refactor the code to improve clarity and readability.",
      },
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    -- config = function()
    --   local present, wk = pcall(require, "which-key")
    --   if not present then
    --     return
    --   end

    --   wk.register({
    --     a = {
    --       a = {
    --         name = "Copilot Chat",
    --       }
    --     }
    --   }, {
    --     mode = "n",
    --     prefix = "<leader>",
    --     silent = true,
    --     noremap = true,
    --     nowait = false,
    --   })
    -- end,
    dependencies = {
      { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader>ab", "<cmd>CopilotChatBuffer<cr>",   mode = 'n', desc = "CopilotChat - Chat with current buffer" },
      { "<leader>aa", "<cmd>CopilotChatToggle<cr>",   mode = 'v', desc = "CopilotChat - show panel" },
      { "<leader>aa", "<cmd>CopilotChatToggle<cr>",   mode = 'n', desc = "CopilotChat - show panel" },
      { "<leader>ae", "<cmd>CopilotChatExplain<cr>",  mode = 'v', desc = "CopilotChat - Explain code" },
      { "<leader>at", "<cmd>CopilotChatTests<cr>",    mode = 'v', desc = "CopilotChat - Generate tests" },
      { "<leader>ar", "<cmd>CopilotChatReview<cr>",   mode = 'v', desc = "CopilotChat - Review code" },
      { "<leader>aR", "<cmd>CopilotChatRefactor<cr>", mode = 'v', desc = "CopilotChat - Refactor code" },
      { "<leader>ad", "<cmd>CopilotChatDocs<cr>",     mode = 'v', desc = "CopilotChat - write document" },
      { "<leader>ad", "<cmd>CopilotChatDocs<cr>",     mode = 'n', desc = "CopilotChat - write document" },
      -- Show help actions with telescope
      {
        "<leader>ah",
        function()
          require("CopilotChat.code_actions").show_help_actions()
        end,
        desc = "CopilotChat - Help actions",
      },
      {
        "<leader>ap",
        ":lua require('CopilotChat.code_actions').show_prompt_actions(true)<CR>",
        mode = "x",
        desc = "CopilotChat - Prompt actions",
      },
    },
  },
  { "szw/vim-maximizer" },
  { 'zhimsel/vim-stay' },
}
