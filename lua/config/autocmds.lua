-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local augroup = vim.api.nvim_create_augroup

-- JS/TS: organize imports + format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("FormatJSLike", { clear = true }),
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function(ev)
    local client = vim.lsp.get_clients({ name = "vtsls", bufnr = ev.buf })[1]

    if client and LazyVim and LazyVim.lsp and LazyVim.lsp.action then
      pcall(LazyVim.lsp.action["source.organizeImports"])
      pcall(LazyVim.lsp.action["source.fixAll"])
    end

    require("conform").format({
      bufnr = ev.buf,
      lsp_format = "fallback",
      timeout_ms = 2000,
    })
  end,
})

-- C#: format on save only
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("FormatCSharp", { clear = true }),
  pattern = { "*.cs", "*.csproj", "*.sln" },
  callback = function(ev)
    require("conform").format({
      bufnr = ev.buf,
      lsp_format = "fallback",
      timeout_ms = 2000,
    })
  end,
})
local function MyCppKeywordColors()
  local yellow = "#FABD2F"

  -- class/struct often here
  vim.api.nvim_set_hl(0, "@keyword.type.cpp", { fg = yellow })
  vim.api.nvim_set_hl(0, "@keyword.type", { fg = yellow })

  -- public/private/protected often here
  vim.api.nvim_set_hl(0, "@keyword.modifier.cpp", { fg = yellow })
  vim.api.nvim_set_hl(0, "@keyword.modifier", { fg = yellow })

  -- fallback
  vim.api.nvim_set_hl(0, "@keyword.cpp", { fg = yellow })
end

MyCppKeywordColors()
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.schedule(MyCppKeywordColors)
  end,
})
