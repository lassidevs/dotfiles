return {
	"mfussenegger/nvim-dap",
	config = function()
		local keymap = vim.keymap -- for conciseness

		-- defined keymaps here so they load only when this plugin is loaded. AKA if this plugin is removed, these are no longer valid. This is to prevent errors in the future.
		keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint <CR>", { desc = "Add breakpoint to line" })
		keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>", { desc = "Start or continue the debugger" })
	end,
}
