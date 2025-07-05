local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- Function to detect if a pane is running Neovim
local function is_vim(pane)
	-- Check for the user variable that smart-splits.nvim sets
	return pane:get_user_vars().IS_NVIM == "true"
end

-- Direction key mapping
local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	-- reverse lookup
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

-- Helper function for smart navigation between Neovim and WezTerm
local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "ALT" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- Pass the keys through to Neovim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "ALT" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 5 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

-- Set WSL as default domain
config.default_domain = "WSL:Ubuntu-22.04"

-- Equivalent to set -s escape-time 0
config.bypass_mouse_reporting_modifiers = "SHIFT"

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.tab_bar_at_bottom = true
config.enable_scroll_bar = false
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

-- Base key bindings
local keys = {
	{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	-- Reload configuration
	{ key = "r", mods = "LEADER", action = act.ReloadConfiguration },

	-- Split panes
	{ key = "%", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "LEADER|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Maximize pane
	{ key = "m", mods = "LEADER", action = act.TogglePaneZoomState },

	-- Copy mode
	{ key = "c", mods = "CTRL|ALT", action = act.ActivateCopyMode },

	-- Paste buffer
	{ key = "P", mods = "LEADER|SHIFT", action = act.PasteFrom("Clipboard") },

	-- Tab navigation
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "w", mods = "CTRL", action = act.ShowTabNavigator },

	-- Resize pane mode
	{
		key = "h",
		mods = "LEADER",
		action = act.Multiple({
			act.AdjustPaneSize({ "Left", 5 }),
			act.ActivateKeyTable({
				name = "resize_pane",
				timeout_milliseconds = 300,
				one_shot = false,
				replace_current = false,
				until_unknown = false,
			}),
		}),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.Multiple({
			act.AdjustPaneSize({ "Down", 5 }),
			act.ActivateKeyTable({
				name = "resize_pane",
				timeout_milliseconds = 300,
				one_shot = false,
				replace_current = false,
				until_unknown = false,
			}),
		}),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.Multiple({
			act.AdjustPaneSize({ "Up", 5 }),
			act.ActivateKeyTable({
				name = "resize_pane",
				timeout_milliseconds = 300,
				one_shot = false,
				replace_current = false,
				until_unknown = false,
			}),
		}),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.Multiple({
			act.AdjustPaneSize({ "Right", 5 }),
			act.ActivateKeyTable({
				name = "resize_pane",
				timeout_milliseconds = 300,
				one_shot = false,
				replace_current = false,
				until_unknown = false,
			}),
		}),
	},
}

table.insert(keys, split_nav("move", "h"))
table.insert(keys, split_nav("move", "j"))
table.insert(keys, split_nav("move", "k"))
table.insert(keys, split_nav("move", "l"))

table.insert(keys, split_nav("resize", "h"))
table.insert(keys, split_nav("resize", "j"))
table.insert(keys, split_nav("resize", "k"))
table.insert(keys, split_nav("resize", "l"))

config.keys = keys

config.key_tables = {
	copy_mode = {
		{ key = "v", mods = "", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
		-- Copy selection to clipboard and exit copy mode
		{
			key = "y",
			mods = "",
			action = act.Multiple({
				act.CopyTo("ClipboardAndPrimarySelection"),
				act.CopyMode("Close"),
			}),
		},
		-- Toggle line selection
		{ key = "r", mods = "", action = act.CopyMode({ SetSelectionMode = "Line" }) },
		-- Navigation keys
		{ key = "h", mods = "", action = act.CopyMode("MoveLeft") },
		{ key = "j", mods = "", action = act.CopyMode("MoveDown") },
		{ key = "k", mods = "", action = act.CopyMode("MoveUp") },
		{ key = "l", mods = "", action = act.CopyMode("MoveRight") },
		-- Exit copy mode
		{ key = "Escape", mods = "", action = act.CopyMode("Close") },
	},
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 5 }) },
		-- Escape will immediately exit the mode
		{ key = "Escape", action = act.PopKeyTable },
		-- Continue to allow pane navigation while in resize mode
		{ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
	},
}

-- Mouse bindings - when lazy
config.mouse_bindings = {
	-- Right click to paste from clipboard
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = act.PasteFrom("Clipboard"),
	},
	-- Double-click to select word
	{
		event = { Down = { streak = 2, button = "Left" } },
		mods = "NONE",
		action = act.SelectTextAtMouseCursor("Word"),
	},
	-- Triple-click to select line
	{
		event = { Down = { streak = 3, button = "Left" } },
		mods = "NONE",
		action = act.SelectTextAtMouseCursor("Line"),
	},
}

-- Set some appearance options
config.window_background_opacity = 1.0
config.font = wezterm.font("JetBrains Mono")
config.font_size = 11.0
-- config.color_scheme = "Catppuccin Mocha"

return config
