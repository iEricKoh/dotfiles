local set = vim.opt

-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_transparent_sidebar = true
require("tokyonight").setup({
  style = "storm",

  transparent = true,
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value `:help attr-list`
    comments = "italic",
    keywords = "italic",
    functions = "NONE",
    variables = "NONE",
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
})

vim.cmd([[colorscheme tokyonight]])

vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"

set.tabstop = 2
set.softtabstop = 2
vim.o.shiftround = true

set.shiftwidth = 2
set.shiftwidth = 2

set.expandtab = true

set.autoindent = true
vim.o.smartindent = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.cmdheight = 1

set.autoread = true

vim.o.whichwrap = "<,>,[,]"

vim.o.hidden = true

vim.o.mouse = "a"

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.o.updatetime = 300

vim.o.timeoutlen = 500

vim.o.splitbelow = true
vim.o.splitright = true

vim.g.completeopt = "menu,menuone,noselect,noinsert"

vim.o.background = "dark"
vim.o.termguicolors = true
set.termguicolors = true

-- vim.o.list = true
-- vim.o.listchars = "space:·,tab:··"

vim.o.wildmenu = true

vim.o.shortmess = vim.o.shortmess .. "c"

vim.o.pumheight = 15

vim.o.showtabline = 2

vim.o.showmode = false

set.clipboard = "unnamedplus"

set.undofile = true

set.wildignore = ""
