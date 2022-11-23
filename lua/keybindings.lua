-- local saga = require("lspsaga")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", dir = "git_dir" })

-- saga.init_lsp_saga()

vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = { noremap = true, silent = true }

local map = function(key)
	-- get the extra options
	local opts = { noremap = false }
	for i, v in pairs(key) do
		if type(i) == "string" then
			opts[i] = v
		end
	end

	-- basic support for buffer-scoped keybindings
	local buffer = opts.buffer
	opts.buffer = nil

	if buffer then
		vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
	else
		vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
	end
end

local function nkeymap(key, action)
	map({ "n", key, action, opt })
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Jump out of pair
map({ "i", "<S-Tab>", "<C-o>A", opt })

map({ "c", "<C-j>", "<C-n>" })
map({ "c", "<C-k>", "<C-p>" })

-- ctrl + /
map({ "n", "<C-/>", "gcc" })
map({ "v", "<C-/>", "gcc" })

nkeymap("<C-j>", "4j")
nkeymap("<C-k>", "4k")
nkeymap("<C-u>", "9k")
nkeymap("<C-d>", "9j")

-- magic search
map({ "n", "/", "/\\v", {
	noremap = true,
	silent = false,
} })
map({ "v", "/", "/\\v", {
	noremap = true,
	silent = false,
} })

-- indent
map({ "v", "<", "<gv", opt })
map({ "v", ">", ">gv", opt })
-- moving selected line
map({ "v", "J", ":move '>+1<CR>gv-gv", opt })
map({ "v", "K", ":move '<-2<CR>gv-gv", opt })

map({ "v", "p", '"_dP', opt })

-- exit
nkeymap("q", ":q<CR>")
nkeymap("qq", ":q!<CR>")
nkeymap("Q", ":qa!<CR>")

-- window spliting
nkeymap("sv", ":vsp<CR>")
nkeymap("sh", ":sp<CR>")
nkeymap("sc", "<C-w>c")
nkeymap("so", "<C-w>o")

-- window navigation
-- nkeymap("<A-h>", "<C-w>h")
-- nkeymap("<A-j>", "<C-w>j")
-- nkeymap("<A-k>", "<C-w>k")
-- nkeymap("<A-l>", "<C-w>l")

---- plugin keybindings  ----
local pluginKeys = {}

-- nvim-tree
map({ "n", "<C-e>", "<cmd>lua require'nvim-tree'.toggle(false, true)<cr>", opt })
map({ "n", "<C-y>", "<cmd>lua require'nvim-tree'.find_file(true)<cr>", opt })

pluginKeys.nvim_tree = {
	{
		key = "v",
		action = "vsplit",
	},
	{
		key = "h",
		action = "split",
	},
	{
		key = "i",
		action = "toggle_ignored",
	},
	{
		key = ".",
		action = "toggle_dotfiles",
	},
	{
		key = "<F5>",
		action = "refresh",
	},
}

-- trouble
nkeymap("<leader>xx", "<cmd>Trouble<cr>")
nkeymap("<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
nkeymap("<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
nkeymap("<leader>xl", "<cmd>Trouble loclist<cr>")
nkeymap("<leader>xq", "<cmd>Trouble quickfix<cr>")
nkeymap("gR", "<cmd>Trouble lsp_references<cr>")
nkeymap("<C-j>", "<cmd>lua require'trouble'.next({skip_groups = true, jump = true})<cr>")
nkeymap("<C-k>", "<cmd>lua require'trouble'.previous({skip_groups = true, jump = true})<cr>")

-- flutter-tools
map({ "n", "U", "<cmd>lua require'telescope'.extensions.flutter.commands()<cr>", opt })

-- buffer-line
-- navigation
nkeymap("<C-h>", ":BufferLineCyclePrev<CR>")
nkeymap("<C-l>", ":BufferLineCycleNext<CR>")
nkeymap("<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>")
nkeymap("<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>")
nkeymap("<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>")
nkeymap("<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>")
nkeymap("<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>")
nkeymap("<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>")
nkeymap("<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>")
nkeymap("<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>")
nkeymap("<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>")
-- exit
nkeymap("<leader>bl", ":BufferLineCloseRight<CR>")
nkeymap("<leader>bh", ":BufferLineCloseLeft<CR>")
nkeymap("<leader>bc", ":BufferLinePickClose<CR>")

-- Telescope
function _lazygit_toggle()
	lazygit:toggle()
end

nkeymap("<C-p>", ":Telescope find_files<CR>")
nkeymap("<C-g>", ":Telescope live_grep<CR>")
nkeymap("<C-n>", ":Telescope buffers<CR>")
nkeymap("<C-i>", ":Telescope buffers<CR>")
nkeymap("<leader>g", "<cmd>lua _lazygit_toggle()<CR>")

pluginKeys.telescope = {
	i = {
		-- menu navigation
		["<C-j>"] = "move_selection_next",
		["<C-k>"] = "move_selection_previous",
		["<C-n>"] = "move_selection_next",
		["<C-p>"] = "move_selection_previous",
		-- history
		["<Down>"] = "cycle_history_next",
		["<Up>"] = "cycle_history_prev",
		-- preview window navigation
		["<C-u>"] = "preview_scrolling_up",
		["<C-d>"] = "preview_scrolling_down",
	},
}

-- Hop
map({ "n", "f", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>" })
map({ "n", "F", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>" })
map({
	"o",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump = true })<cr>",
})
map({
	"o",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, inclusive_jump = true })<cr>",
})
map({ "", "t", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>" })
map({ "", "T", "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>" })

-- nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
-- nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
-- nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
-- nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
-- nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
-- nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
-- nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
-- nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
-- nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
-- nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')

return pluginKeys
