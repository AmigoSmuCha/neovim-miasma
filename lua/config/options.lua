-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local map = vim.keymap.set

map({ "n", "v" }, ";", ":", {
  desc = "Enter command mode",
  noremap = true,
  nowait = true,
})

map("i", "<C-H>", "<C-W>", { desc = "Delete word backward" })
map("i", "<C-BS>", "<C-W>", { desc = "Delete word backward" })
