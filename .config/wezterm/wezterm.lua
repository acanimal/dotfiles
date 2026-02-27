local wezterm = require("wezterm") ---@type Wezterm
local config = wezterm.config_builder() ---@type Config

-- --------------------------------------------------------------------
-- APPEARANCE & SETTINGS
-- --------------------------------------------------------------------
config.initial_cols = 80
config.initial_rows = 25

config.font_size = 14
config.font = wezterm.font("Hack Nerd Font Mono")
-- config.color_scheme = "tokyonight_night"
config.colors = {
	cursor_bg = "#7aa2f7",
	cursor_border = "#7aa2f7",
}
-- dim inactive pane
config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.5,
}

config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.show_tabs_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = false
config.tab_and_split_indices_are_zero_based = false
config.tab_max_width = 25
config.use_fancy_tab_bar = true
config.hide_mouse_cursor_when_typing = true

-- --------------------------------------------------------------------
-- KEYBOARD SHORTCUTS (KEYMAPS)
-- --------------------------------------------------------------------
config.disable_default_key_bindings = false
config.keys = {
	-- Move by words
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action.SendString("\u{1b}b") },
	{ key = "RightArrow", mods = "OPT", action = wezterm.action.SendString("\u{1b}f") },

	-- Move to Start/End of line (Command + Arrows)
	{ key = "LeftArrow", mods = "CMD", action = wezterm.action.SendString("\u{1}") }, -- Equivalent to Ctrl-A
	{ key = "RightArrow", mods = "CMD", action = wezterm.action.SendString("\u{5}") }, -- Equivalent to Ctrl-E

	-- Split Panes
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitPane({ direction = "Right", size = { Percent = 50 } }),
	},
	{
		key = "D",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitPane({ direction = "Down", size = { Percent = 50 } }),
	},

	-- Navigate Panes (Alt + Command + Arrows)
	{ key = "LeftArrow", mods = "CMD|OPT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CMD|OPT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "CMD|OPT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CMD|OPT", action = wezterm.action.ActivatePaneDirection("Down") },

	-- Command Palette (Force Enable)
	{ key = "p", mods = "CMD|SHIFT", action = wezterm.action.ActivateCommandPalette },
}

-- --------------------------------------------------------------------
-- WINDOW STARTUP EVENTS
-- --------------------------------------------------------------------
wezterm.on("gui-startup", function(cmd)
	-- Spawn a new window and get its handle
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()

	-- Maximize the window immediately on startup
	gui_window:maximize()
end)

return config
