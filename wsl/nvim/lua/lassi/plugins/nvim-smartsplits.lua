return {
	{
		"mrjones2014/smart-splits.nvim",
		config = function()
			require("smart-splits").setup({
				-- Recommended settings
				-- ignored_filetypes = {
				-- 	"nofile",
				-- 	"quickfix",
				-- 	"qf",
				-- 	"prompt",
				-- },
				-- ignored_buftypes = { "NvimTree" },

				-- This is crucial for the integration to work!
				multiplexer_integration = "wezterm",
			})

			-- Set up your keymaps
			vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
			vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
			vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
			vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)

			-- Resize with Alt+hjkl
			vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
			vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
			vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
			vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
		end,
	},
}
