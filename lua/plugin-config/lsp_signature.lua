require("lsp_signature").setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  -- handler_opts = {
  --   border = "rounded",
  -- },
  use_lspsaga = true,
  -- hint_enable = true,
  transparency = 90,
  -- hi_parameter = "Search",
  handler_opts = { "none" },
})
