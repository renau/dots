-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

local opt = vim.opt
opt.relativenumber = false -- Relative line numbers
opt.wildmode = "longest,list"

-- Do not hide ''' markdown text
opt.conceallevel = 0
