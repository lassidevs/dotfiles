return {
	{
		"mrjones2014/smart-splits.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("smart-splits").setup({
				-- Recommended settings
				ignored_filetypes = {
					"nofile",
					"quickfix",
					"qf",
					"prompt",
				},
				ignored_buftypes = { "NvimTree" },

				-- This is crucial for the integration to work!
				multiplexer_integration = "wezterm",

				vim.g.smart_splits_multiplexer_integration,
			})
			-- Set up your keymaps
			vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
			vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
			vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
			vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
		end,
	},
}
