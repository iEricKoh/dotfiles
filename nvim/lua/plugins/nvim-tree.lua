return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    view = {
      side = "right",
    },
    on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
      vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
      vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open: Horizontal Split"))
      vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
      vim.keymap.set("n", "i", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
    end,
  },

  keys = {
    { "<C-e>", "<cmd>NvimTreeFindFile<cr>", desc = "Explorer FileTree", remap = true },
  },
}
