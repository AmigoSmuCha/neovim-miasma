-- lua/plugins/highlight-colors.lua
return {
  {
    "brenoprata10/nvim-highlight-colors",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- Pick ONE:
      render = "background", -- colors the background behind "#RRGGBB"
      -- render = "foreground", -- colors the text itself
      -- render = "first_column", -- like a color bar in the sign column

      enable_hex = true,
      enable_rgb = true,
      enable_hsl = true,
    },
  },
}
