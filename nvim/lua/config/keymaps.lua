-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<c-P>", require("fzf-lua").files)
vim.keymap.set("n", "<c-N>", require("fzf-lua").buffers)
vim.keymap.set("n", "<c-G>", require("fzf-lua").live_grep)
