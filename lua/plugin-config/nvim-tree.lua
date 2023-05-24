vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open: Horizontal Split"))
  vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
  vim.keymap.set("n", "i", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
end

require("nvim-tree").setup({
  view = {
    side = "right",
  },
  on_attach = on_attach,
})

-- on_attach = function()
--   local api = require("nvim-tree.api")
--   vim.keymap.set("n", "v", api.node.open.vertical)
--   vim.keymap.set("n", "h", api.node.open.horizontal)
--   -- vim.keymap.set("n", ".", api.tree.toggle_hidden_filter)
--   -- vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter)
-- end,
