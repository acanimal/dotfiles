local wezterm = require("wezterm")
local mux = wezterm.mux
local action = wezterm.action
local config = {}

config.color_scheme = "Batman"
config.enable_scroll_bar = true
config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 13
config.line_height = 1
config.hide_mouse_cursor_when_typing = true
config.hide_tab_bar_if_only_one_tab = true
config.initial_rows = 60
config.initial_cols = 180
config.switch_to_last_active_tab_when_closing_tab = true
config.window_decorations = "RESIZE"

-- Config movement keys
config.keys = {
	-- Move cursor word by word
	{ mods = "OPT", key = "LeftArrow", action = action.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "OPT", key = "RightArrow", action = action.SendKey({ mods = "ALT", key = "f" }) },
	-- Move cursor to begining and end of line
	{ mods = "CMD", key = "LeftArrow", action = action.SendKey({ mods = "CTRL", key = "a" }) },
	{ mods = "CMD", key = "RightArrow", action = action.SendKey({ mods = "CTRL", key = "e" }) },
	{ mods = "CMD", key = "Backspace", action = action.SendKey({ mods = "CTRL", key = "u" }) },
	-- Split panel
	{ mods = "CMD", key = "d", action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "CMD|SHIFT", key = "d", action = action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "CMD|ALT", key = "LeftArrow", action = action.ActivatePaneDirection("Left") },
	{ mods = "CMD|ALT", key = "RightArrow", action = action.ActivatePaneDirection("Right") },
	{ mods = "CMD|ALT", key = "UpArrow", action = action.ActivatePaneDirection("Up") },
	{ mods = "CMD|ALT", key = "DownArrow", action = action.ActivatePaneDirection("Down") },
}

-- Change color for inactive panes
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.5,
}

-- Maximize on startup
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
