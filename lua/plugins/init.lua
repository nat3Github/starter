return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- atuo save
  {
    "pocco81/auto-save.nvim",
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      -- inject from configs/lspconfig
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "rust-analyzer",
        "python-lsp-server",
        "codelldb", -- for debugging
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        --"rust",
      },
    },
  },

  -- {
  --   "rust-lang/rust.vim",
  --   ft = "rust",
  --   init = function()
  --     --  vim.g.rustfmt_autosave = 1
  --   end,
  -- },

  -- Rust related
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "configs.rustconf"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  -- debugging
  {
    "mfussenegger/nvim-dap",
  },
  -- cargo toml hints
  {
    "saecki/crates.nvim",
    dependencies = "hrsh7th/nvim-cmp",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  -- overrides
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
}
