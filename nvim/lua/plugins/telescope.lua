return	{
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'debugloop/telescope-undo.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
	},
	config = function()
		require("telescope").setup({
			extensions = {
				undo = {
					-- telescope-undo.nvim config
				},
				fzf = {
					fuzzy = true,                    -- false will only do exact matching
					override_generic_sorter = true,  -- override the generic sorter
					override_file_sorter = true,     -- override the file sorter
					case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				}
			}

		})
		local wk = require("which-key")
		require("telescope").load_extension("undo")
		require("telescope").load_extension("fzf")
		vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
		wk.register({
			["<leader>u"] = { "Telescope Undo" }
		})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', function()
			builtin.find_files({
				hidden = true
			})
		end)
		vim.keymap.set('n', '<leader>b', builtin.oldfiles)
		vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
		vim.keymap.set('n', '<leader>sf', builtin.live_grep, {})
		wk.register({
			ff = { "Find files" },
			gf = { "Find files (git)" },
			sf = { "Search files (grep)" },
			b = { "Old buffers" },
		}, { prefix = "<leader>" })
	end
}
