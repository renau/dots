-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>ts", function()
  MiniTrailspace.trim()
end, { desc = "Trip training spaces" })

-- Register bazel for key explanation
local wk = require("which-key")
wk.register({
  ["<leader>b"] = { name = "+bazel" },
})

-- bazel
local bazel = require("bazel")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "bzl",
  callback = function()
    map("n", "gd", vim.fn.GoToBazelDefinition, { buffer = true, desc = "Goto Definition" })
  end,
})
map("n", "gbt", vim.fn.GoToBazelTarget, { desc = "Goto Bazel Build File" })
map("n", "<Leader>bl", bazel.run_last, { desc = "Bazel Last" })
map("n", "<Leader>bt", function()
  bazel.run_here("test", vim.g.bazel_config)
end, { desc = "Bazel Test" })

map("n", "<Leader>bc", function()
  bazel.run_here("build", vim.g.bazel_config .. " -c dbg")
end, { desc = "Bazel Debug Build" })

map("n", "<Leader>br", function()
  bazel.run_here("run", vim.g.bazel_config)
end, { desc = "Bazel Run" })
