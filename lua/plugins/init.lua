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

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      --  vim.g.rustfmt_autosave = 1
    end,
  },
}
