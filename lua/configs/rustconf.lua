-- EXAMPLE
local xon_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- enable inlay hints
local function on_attach(client, bufnr)
  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  xon_attach(client, bufnr)
end

local opts = {

  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    on_init = on_init,
  },
}
return opts
