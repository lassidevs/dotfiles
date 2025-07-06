vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- lua keymap file for generic keymaps. Avoid adding plugin-specific keymaps as those will throw errors if the plugin is removed

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment / decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) --increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) --decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>to", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- primeagen
-- delete a selection of text and paste something over it, without copying the deleted text to registery. _d is the blackhole registery
keymap.set("x", "<leader>p", '"_dP', { desc = "Delete selection to blac" })
keymap.set("n", "<leader>o", "o<ESC>", { desc = "Insert newline and stay on normal mode" })

-- move highlighted text around (similar to vscode)
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
