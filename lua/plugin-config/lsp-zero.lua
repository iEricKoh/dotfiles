local lsp = require("lsp-zero")
local cmp = require("cmp")

lsp.preset("recommended")

lsp.set_preferences({
  set_lsp_keymaps = false,
})
-- local select_opts = { behavior = cmp.SelectBehavior.Select }
--
-- lsp.on_attach(function(client, bufnr)
--   local noremap = { buffer = bufnr, remap = false }
--   local bind = vim.keymap.set
--
--   require("keybindings").cmp(cmp)
--   -- bind("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>", noremap)
--   -- ['<Up>'] = cmp.mapping.select_prev_item(select_opts)
--   --     ['<Down>'] = cmp.mapping.select_next_item(select_opts)
--   -- more code  ...
-- end)
lsp.setup_nvim_cmp({
  mapping = require("keybindings").cmp(cmp),
})

lsp.setup()
