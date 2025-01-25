return {
  --nightfly
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    -- lazy = true,
  },
  --moonfly
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    -- lazy = true,
  },
  -- material
  {
    "marko-cerovac/material.nvim",
    -- lazy = true,
    name = "material",
    opts = { style = "dragon" },
  },
  {
    "folke/tokyonight.nvim",
  },
  -- kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = true,
      undercurl = true,
      commentStyle = { italic = false },
      functionStyle = {},
      keywordStyle = { italic = false },
      statementStyle = { bold = false },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      colors = {
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave",
    },
  },
}
