-- return {
--   {
--     "Mofiqul/vscode.nvim",
--     opts = {
--       transparent = true,
--       styles = { sidebars = "transparent", floats = "transparent" },
--     },
--   },
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "vscode",
--     },
--   },
-- }

return {
  {
    "Mofiqul/vscode.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      -- Optional: enables terminal colors matching the theme
      terminal_colors = true,
      -- Optional: style tweaks
      italic_comments = true,
      underline_links = true,
      -- Transparent backgrounds and borders for various UI elements
      group_overrides = {
        StatusLine = { bg = "NONE" },
        StatusLineNC = { bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        VertSplit = { fg = "#000000" },
        FloatBorder = { fg = "#252525" },
        Pmenu = { bg = "NONE" },
        -- PmenuSel = { bg = "NONE" },

        -- NormalNC = { bg = "NONE" },
        -- LineNr = { bg = "NONE" },
        -- SignColumn = { bg = "NONE" },
        -- EndOfBuffer = { bg = "NONE" },
        -- -- Add plugin-specific borders as needed:
        -- TelescopeBorder = { fg = "#252525" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
