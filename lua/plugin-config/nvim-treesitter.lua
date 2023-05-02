local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  vim.notify("nvim-treesitter is unavailable.")
  return
end

treesitter.setup({
  -- ensure_installed = "all",
  ensure_installed = { "javascript", "lua", "json", "typescript", "kotlin" },

  ignore_install = { "php", "phpdoc" },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- incremental_selection = {
  -- 	enable = true,
  -- 	keymaps = {
  -- 		init_selection = "<CR>",
  -- 		node_incremental = "<CR>",
  -- 		node_decremental = "<BS>",
  -- 		scope_incremental = "<TAB>",
  -- 	},
  -- },

  indent = {
    enable = true,
  },

  -- p00f/nvim-ts-rainbow
  -- rainbow = {
  -- 	enable = true,
  -- 	-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
  -- 	extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  -- 	max_file_lines = nil, -- Do not enable for files with more than n lines, int
  -- 	-- colors = {}, -- table of hex strings
  -- 	-- termcolors = {} -- table of colour name strings
  -- },
})

-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldlevel = 99
