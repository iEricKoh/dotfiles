-- Auto installing packer.nvim
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
	vim.notify("Installing packer.nvim...")
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})

	-- https://github.com/wbthomason/packer.nvim/issues/750
	local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
	if not string.find(vim.o.runtimepath, rtp_addition) then
		vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
	end
	vim.notify("packer.nvim installed")
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Missing packer.nvim")
	return
end

packer.startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Theme
	use("folke/tokyonight.nvim")

	use("windwp/nvim-autopairs")

	use({ "akinsho/toggleterm.nvim" })

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("mfussenegger/nvim-dap")
	use("nvim-telescope/telescope-dap.nvim")

	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup({})
		end,
	})

	use("lukas-reineke/indent-blankline.nvim")

	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Lsp related
	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
	})

	use({
		"akinsho/flutter-tools.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("b0o/schemastore.nvim")

	use("hrsh7th/nvim-cmp")
	use("mhartington/formatter.nvim")

	use("simrat39/rust-tools.nvim")

	use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use({ "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" })

	-- vsnip
	use("hrsh7th/cmp-vsnip") -- { name = 'vsnip' }
	use("hrsh7th/vim-vsnip")
	use("rafamadriz/friendly-snippets")

	-- lsp UI
	use("onsails/lspkind-nvim")
	use("tami5/lspsaga.nvim")

	use({ "p00f/nvim-ts-rainbow" })

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})

	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)

pcall(
	vim.cmd,
	[[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
)
