return {
	"mbbill/undotree",

	config = function()
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)
	end,
}
