return {
	"vyfor/cord.nvim",
	event = "VimEnter",
	config = function()
		local cord = require("cord").setup({
			editor = {
				tooltip = "The One True Text Editor",
			},
			text = {
				default = nil,
				workspace = function(opts)
					return "In " .. opts.workspace
				end,
				viewing = function(opts)
					return "Viewing " .. opts.filename
				end,
				editing = function(opts)
					return "Editing " .. opts.filename
				end,
				file_browser = function(opts)
					return "Exploring in " .. opts.name
				end,
				plugin_manager = function(opts)
					return "Managing plugins in " .. opts.name
				end,
				lsp = function(opts)
					return "Configuring LSP in " .. opts.name
				end,
				docs = function(opts)
					return "Reading " .. opts.name
				end,
				vcs = function(opts)
					return "Committing changes in " .. opts.name
				end,
				notes = function(opts)
					return "Taking notes in " .. opts.name
				end,
				debug = function(opts)
					return "Debugging in " .. opts.name
				end,
				test = function(opts)
					return "Testing in " .. opts.name
				end,
				diagnostics = function(opts)
					return "Fixing problems in " .. opts.name
				end,
				games = function(opts)
					return "Playing " .. opts.name
				end,
				terminal = function(opts)
					return "Running commands in " .. opts.name
				end,
				dashboard = "Home",
			},
		})
	end,
}
