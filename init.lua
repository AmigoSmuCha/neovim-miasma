-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.clipboard = "unnamedplus"
vim.o.termguicolors = true

local function MyLuaFunctionColors()
  local fn = "#7aa2f7" -- tvoje barva

  -- Tree-sitter (fallback)
  vim.api.nvim_set_hl(0, "@function.lua", { fg = fn })
  vim.api.nvim_set_hl(0, "@function.call.lua", { fg = fn })

  -- LSP semantic tokens (tohle reálně vyhrává)
  vim.api.nvim_set_hl(0, "@lsp.type.function.lua", { fg = fn })
  vim.api.nvim_set_hl(0, "@lsp.typemod.function.declaration.lua", { fg = fn })

  -- aby se ti při "reference highlight" neměnila barva, jen se podtrhlo:
  vim.api.nvim_set_hl(0, "LspReferenceText", { underline = true, bg = "NONE" })
  vim.api.nvim_set_hl(0, "LspReferenceRead", { underline = true, bg = "NONE" })
  vim.api.nvim_set_hl(0, "LspReferenceWrite", { underline = true, bg = "NONE" })
end

-- apply hned (pro případ, že už něco běží)
MyLuaFunctionColors()

local aug = vim.api.nvim_create_augroup("MyStableHighlights", { clear = true })

-- po změně colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
  group = aug,
  callback = function()
    vim.schedule(MyLuaFunctionColors)
  end,
})

-- po připojení LSP (semantic tokens se často aktivují až teď)
vim.api.nvim_create_autocmd("LspAttach", {
  group = aug,
  callback = function()
    vim.schedule(MyLuaFunctionColors)
  end,
})

-- po eventu lazy.nvim, kdy LazyVim často doaplikuje UI věci
vim.api.nvim_create_autocmd("User", {
  group = aug,
  pattern = "VeryLazy",
  callback = function()
    vim.schedule(MyLuaFunctionColors)
  end,
})
