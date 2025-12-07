return {
	"mbbill/undotree",

	keys = {
		{
			"<leader>u",
			function()
				vim.cmd.UndotreeToggle()
			end,
			desc = "Toggle Undotree",
		},
	},

	config = function()
		-- Persistent undo setup
		if vim.fn.has("persistent_undo") == 1 then
			local target_path = vim.fn.expand("~/.undodirr")

			if vim.fn.isdirectory(target_path) == 0 then
				vim.fn.mkdir(target_path, "p", 448)
			end

			vim.o.undodir = target_path
			vim.o.undofile = true
		end
	end,
}
