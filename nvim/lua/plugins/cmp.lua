return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji" },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
      ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
    })

    opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
  end,
}
