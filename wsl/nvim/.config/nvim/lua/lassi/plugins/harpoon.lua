return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		local harpoon = require("harpoon")
		local keymap = vim.keymap

		harpoon:setup({})

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		keymap.set("n", "<C-m>", function()
			harpoon:list():add()
		end, { desc = "Tag with harpoon" })

		keymap.set("n", "<leader>a", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon toggle quick menu" })

		-- harpoon quick select
		keymap.set("n", "<C-y>", function()
			harpoon:list():select(1)
		end)
		keymap.set("n", "<C-u>", function()
			harpoon:list():select(2)
		end)
		keymap.set("n", "<C-i>", function()
			harpoon:list():select(3)
		end)
		keymap.set("n", "<C-o>", function()
			harpoon:list():select(4)
		end)
		keymap.set("n", "<C-p>", function()
			harpoon:list():select(5)
		end)

		-- toggle telescope harpoon view
		keymap.set("n", "<C-a>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
