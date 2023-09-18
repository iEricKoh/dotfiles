return {
  "goolord/alpha-nvim",

  opts = function(_, opts)
    local logo = [[
"  __      _",
"o'')}____//",
" `_/      )",
" (_(_/-(_/ ",

 ]]

    opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
  end,
}
