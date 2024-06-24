-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",

  statusline = {
    theme = "vscode_colored",
  },

  cmp = {
    lspkind_text = false,
    style = "flat_dark", -- default/flat_light/flat_dark/atom/atom_colored
  },
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.term = {
  float = {
    width = 0.9,
    height = 0.9,
  },
}
return M
