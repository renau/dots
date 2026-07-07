-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.lazyvim_check_order = false


require("config.lazy")

vim.cmd("set background=dark")
vim.cmd("colorscheme kanagawa-wave")
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ff0000" })


vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    local path = vim.api.nvim_buf_get_name(args.buf)
    if path:match("/nekko/") then
      vim.b.autoformat = false
    end
  end,
})
