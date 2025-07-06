# Blazingly Fast Neovim Configuration ⚡

This repository contains my Neovim configuration. The setup is built on vanilla Neovim with Lazy package manager, including only essential plugins and configurations tailored for various development tasks. This setup takes up only roughly 11MB of memory!

## Supported Languages

- **TypeScript** (React, Vue, Svelte)
- **Python**
- **Rust**
- **C++**

## Plugins

### LSP Configuration

- **`lspconfig.lua`**: Configures LSP servers for various languages, providing features like code completion, linting, and more.
- **`mason.lua`**: Manages the installation of LSP servers and other tools.

### Plugin Management

- **`alpha.lua`**: Provides a dashboard for Neovim with a customizable welcome screen.
- **`auto-session.lua`**: Automatically saves and restores your Neovim sessions.
- **`autopairs.lua`**: Automatically inserts matching parentheses, brackets, and quotes.
- **`bufferline.lua`**: Adds a buffer line with clickable tabs for managing open buffers.
- **`colorscheme.lua`**: Sets up the color scheme for Neovim.
- **`comment.lua`**: Enhances commenting capabilities in code.
- **`discord-presence.lua`**: Displays your Neovim activity on Discord. (Does not work on WSL 2, only WSL 1. If you're using this setup on wsl 1, it requires some exhaustive configuration. More information at https://github.com/andweeb/presence.nvim/wiki/Rich-Presence-in-WSL)
- **`dressing.lua`**: Improves Neovim's built-in UI for selecting and input dialogs.
- **`formatting.lua`**: Configures code formatting tools and settings.
- **`gitsigns.lua`**: Shows git changes in the sign column, with features like blame and diff.
- **`indent-blankline.lua`**: Adds indentation guides to improve code readability.
- **`lazygit.lua`**: Integrates LazyGit for a better git experience within Neovim.
- **`linewrapper.lua`**: Configures automatic line wrapping and handling.
- **`linting.lua`**: Sets up linting tools for various languages.
- **`lualine.lua`**: Configures the status line with a powerful and customizable status bar.
- **`mason-nvim-dap.lua`**: Configures Debug Adapter Protocol (DAP) integration using Mason.
- **`nvim-cmp.lua`**: Provides a completion framework with support for various completion sources.
- **`nvim-colorizer.lua`**: Highlights color codes directly in your code.
- **`nvim-dap-ui.lua`**: Sets up the UI for debugging with nvim-dap.
- **`nvim-dap.lua`**: Integrates the Debug Adapter Protocol for debugging.
- **`nvim-tree.lua`**: Provides a file explorer tree for navigating your project.
- **`substitute.lua`**: Enhances search and replace functionalities.
- **`surround.lua`**: Simplifies dealing with surrounding characters like parentheses and quotes.
- **`telescope.lua`**: Configures the fuzzy finder and file search plugin Telescope.
- **`tmuxnavigator.lua`**: Allows seamless navigation between tmux and Neovim panes.
- **`todo-comments.lua`**: Highlights TODO, FIXME, and other comments in your code.
- **`treesitter.lua`**: Configures Tree-sitter for advanced syntax highlighting and code parsing.
- **`trouble.lua`**: Provides a list of diagnostics, quickfix, and location lists.
- **`vim-be-good.lua`**: A Neovim plugin for improving typing speed and accuracy. This is literally just practice tool for Neovim.
- **`vim-maximizer.lua`**: Allows toggling between maximizing and restoring the current window.
- **`which-key.lua`**: Shows a popup with possible key bindings when pressing a key sequence.
