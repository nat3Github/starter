-- EXAMPLE
local xon_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- enable inlay hints
local function on_attach(client, bufnr)
  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  xon_attach(client, bufnr)
end

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }
local util = lspconfig.util

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- lspconfig.rust_analyzer.setup {
--   on_init = on_init,
--   on_attach = on_attach,
--   capabilities = capabilities,
--   --  filetypes = { "rust" },
--   -- root_dir = util.root_pattern "Cargo.toml",
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = {
--         allFeatures = true,
--       },
--     },
--   },
-- }
