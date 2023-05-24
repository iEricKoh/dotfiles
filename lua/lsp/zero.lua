local lsp = require("lsp-zero")
local cmp = require("cmp")

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  mapping = {

    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
  },
})

lsp.preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- lsp.ensure_installed({
--   "tsserver",
--   "eslint",
--   "sumneko_lua",
--   "tailwindcss",
-- })
--
-- lsp.nvim_workspace()
--
-- lsp.configure("tailwindcss", {
--   settings = {
--     tailwindCSS = {
--       rootFontSize = 10,
--     },
--   },
-- })
--
-- lsp.configure("jsonls", {
--   settings = {
--     json = {
--       schemas = require("schemastore").json.schemas(),
--     },
--   },
-- })
--
-- lsp.configure("dartls", { force_setup = true })
--
-- lsp.setup()
--
-- vim.diagnostic.config({
--   virtual_text = true,
-- })
--
-- require("flutter-tools").setup({})
