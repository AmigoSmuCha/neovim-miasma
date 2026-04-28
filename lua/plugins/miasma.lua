return {
  "xero/miasma.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("miasma")

    local function apply_highlights()
      local bg = "#201d1b"
      -- keep your custom background
      vim.api.nvim_set_hl(0, "Normal", { bg = bg })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = bg })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = bg })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg })
      vim.api.nvim_set_hl(0, "LineNr", { bg = bg })
      vim.api.nvim_set_hl(0, "FoldColumn", { bg = bg })
      -- subtle gruvbox-style contrast on important UI
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2623" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#d79921", bg = bg, bold = true })
      vim.api.nvim_set_hl(0, "Visual", { bg = "#3c3836" })
      vim.api.nvim_set_hl(0, "Search", { fg = bg, bg = "#fabd2f", bold = true })
      vim.api.nvim_set_hl(0, "IncSearch", { fg = bg, bg = "#fe8019", bold = true })
      vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ebdbb2", bg = "#3c3836", bold = true })
      vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#a89984", bg = "#2a2623" })
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#504945", bg = bg })
      vim.api.nvim_set_hl(0, "VertSplit", { fg = "#504945", bg = bg })
      vim.api.nvim_set_hl(0, "Pmenu", { fg = "#d4be98", bg = "#2a2623" })
      vim.api.nvim_set_hl(0, "PmenuSel", { fg = bg, bg = "#d79921", bold = true })
      vim.api.nvim_set_hl(0, "MatchParen", { fg = "#fabd2f", bold = true, underline = true })
      -- syntax accents, but not too aggressive
      vim.api.nvim_set_hl(0, "Comment", { fg = "#928374", italic = true })
      vim.api.nvim_set_hl(0, "Keyword", { fg = "#cc241d", bold = true })
      vim.api.nvim_set_hl(0, "Function", { fg = "#b8bb26" })
      vim.api.nvim_set_hl(0, "String", { fg = "#79740E" })
      vim.api.nvim_set_hl(0, "Type", { fg = "#8ec07c" })
      vim.api.nvim_set_hl(0, "Constant", { fg = "#d3869b" })
      -- SOME EXTRAS ADDED TO FIX THE TXT FILETYPE --
      vim.api.nvim_set_hl(0, "SpellBad", { fg = "#FD4A00" })
      vim.api.nvim_set_hl(0, "SpellRare", { fg = "#928374" })
      vim.api.nvim_set_hl(0, "SpellCap", { fg = "#d79921" })
      vim.api.nvim_set_hl(0, "SpellLocal", { fg = "#79740e" })
    end

    apply_highlights()

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = apply_highlights,
    })
  end,
}
