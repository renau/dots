-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.cmd("set background=dark")
vim.cmd("colorscheme kanagawa-wave")
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ff0000" })
