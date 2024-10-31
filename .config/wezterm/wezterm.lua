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
	saturation = 0.6,
	brightness = 0.3,
}

-- Maximize on startup
wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

config.colors = {
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = "#0b0022",

		-- The active tab is the one that has focus in the window
		active_tab = {
			-- The color of the background area for the tab
			bg_color = "#2b2042",
			-- The color of the text for the tab
			fg_color = "#c0c0c0",

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = "Normal",

			-- Specify whether you want "None", "Single" or "Double" underline for
			-- label shown for this tab.
			-- The default is "None"
			underline = "None",

			-- Specify whether you want the text to be italic (true) or not (false)
			-- for this tab.  The default is false.
			italic = false,

			-- Specify whether you want the text to be rendered with strikethrough (true)
			-- or not for this tab.  The default is false.
			strikethrough = false,
		},

		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = "#1b1032",
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over inactive tabs
		inactive_tab_hover = {
			bg_color = "#3b3052",
			fg_color = "#909090",
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
		},

		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = "#1b1032",
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over the new tab button
		new_tab_hover = {
			bg_color = "#3b3052",
			fg_color = "#909090",
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab_hover`.
		},
	},
}

return config
