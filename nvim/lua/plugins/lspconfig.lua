return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "gopls" } })
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup {
			settings = {
				Lua = {
					diagnostics = {
						globals = {
							'vim',
							'require'
						},
					},
				},
			},
		}
		lspconfig.rust_analyzer.setup {}
		vim.keymap.set('n', '<C-e>', vim.diagnostic.open_float)
	end
}
