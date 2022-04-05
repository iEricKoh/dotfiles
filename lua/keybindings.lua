local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", dir = "git_dir" })

vim.g.mapleader = ","
vim.g.maplocalleader = ","

local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

local function nkeymap(key, map)
	keymap("n", key, map, opt)
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Jump out of pair
keymap("i", "<S-Tab>", "<C-o>A", opt)

keymap("c", "<C-j>", "<C-n>", {
	noremap = false,
})
keymap("c", "<C-k>", "<C-p>", {
	noremap = false,
})

-- ctrl + /
keymap("n", "<C-_>", "gcc", {
	noremap = false,
})
keymap("v", "<C-_>", "gcc", {
	noremap = false,
})

nkeymap("<C-j>", "4j")
nkeymap("<C-k>", "4k")
nkeymap("<C-u>", "9k")
nkeymap("<C-d>", "9j")

-- magic search
keymap("n", "/", "/\\v", {
	noremap = true,
	silent = false,
})
keymap("v", "/", "/\\v", {
	noremap = true,
	silent = false,
})

-- indent
keymap("v", "<", "<gv", opt)
keymap("v", ">", ">gv", opt)
-- moving selected line
keymap("v", "J", ":move '>+1<CR>gv-gv", opt)
keymap("v", "K", ":move '<-2<CR>gv-gv", opt)

keymap("v", "p", '"_dP', opt)

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
keymap("n", "<C-e>", "<cmd>lua require'nvim-tree'.toggle(false, true)<cr>", opt)
keymap("n", "<C-y>", "<cmd>lua require'nvim-tree'.find_file(true)<cr>", opt)

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
keymap("n", "U", "<cmd>lua require'telescope'.extensions.flutter.commands()<cr>", opt)

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

pluginKeys.cmp = function(cmp)
	local feedkey = function(key, mode)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	return {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),

		["<C-p>"] = function(fallback)
			for i = 1, 5 do
				cmp.mapping.select_prev_item()(nil)
			end
		end,

		["<C-n>"] = function(fallback)
			for i = 1, 5 do
				cmp.mapping.select_next_item()(nil)
			end
		end,

		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),

		["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),

		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.

		["<C-l>"] = cmp.mapping(function(_)
			if vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			end
		end, { "i", "s" }),
		["<C-h>"] = cmp.mapping(function()
			if vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),

		-- super Tab
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),

		-- ["<S-Tab>"] = cmp.mapping(function()
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif vim.fn["vsnip#jumpable"](-1) == 1 then
		-- 		feedkey("<Plug>(vsnip-jump-prev)", "")
		-- 	end
		-- end, { "i", "s" }),
		-- end of super Tab
	}
end

-- Telescope
function _lazygit_toggle()
	lazygit:toggle()
end

nkeymap("<C-p>", ":Telescope find_files<CR>")
nkeymap("<C-g>", ":Telescope live_grep<CR>")
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

pluginKeys.lsp = function(mapbuf)
	mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
	mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
	mapbuf("n", "gd", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opt)
	mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)

	mapbuf("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opt)
	mapbuf("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opt)
	mapbuf("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opt)
	mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
	mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
	-- diagnostic
	mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
	mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
	mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)

	-- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
	-- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
	-- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
	-- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
	-- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
	-- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
	-- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

pluginKeys.lsp_tsserver = function(mapbuf)
	mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
	mapbuf("n", "gr", ":TSLspRenameFile<CR>", opt)
	mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end

-- Hop
keymap(
	"n",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>",
	{}
)
keymap(
	"n",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",
	{}
)
keymap(
	"o",
	"f",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, inclusive_jump = true })<cr>",
	{}
)
keymap(
	"o",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, inclusive_jump = true })<cr>",
	{}
)
keymap(
	"",
	"t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<cr>",
	{}
)
keymap(
	"",
	"T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<cr>",
	{}
)

-- nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
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
