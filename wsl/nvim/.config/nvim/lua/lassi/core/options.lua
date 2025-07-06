vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.softtabstop = 4
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark default to dark
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

--clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register. Forces neovim to use system clipboard

-- split windows
opt.splitright = true -- split vertical window to the rigiht
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- helpful
vim.opt.scrolloff = 8 -- always keep minimum 8 lines space when scrolling

-- file naming
vim.opt.isfname:append("@-@")
