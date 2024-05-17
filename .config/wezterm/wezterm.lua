local wezterm = require 'wezterm'
local action = wezterm.action
local config = {}

config.color_scheme = 'Batman'
config.enable_scroll_bar = true
config.font = wezterm.font 'Hack Nerd Font Mono'
config.font_size = 14
config.hide_mouse_cursor_when_typing = true
config.initial_rows = 40
config.initial_cols = 180
config.switch_to_last_active_tab_when_closing_tab = true

-- Config movement keys
config.keys = {
  -- Move word by word
  { mods = "OPT", key = "LeftArrow",  action = action.SendKey({ mods = "ALT", key = "b" }) },
  { mods = "OPT", key = "RightArrow", action = action.SendKey({ mods = "ALT", key = "f" }) },
  -- Move line begining and end
  { mods = "CMD", key = "LeftArrow",  action = action.SendKey({ mods = "CTRL", key = "a" }) },
  { mods = "CMD", key = "RightArrow", action = action.SendKey({ mods = "CTRL", key = "e" }) },
  { mods = "CMD", key = "Backspace",  action = action.SendKey({ mods = "CTRL", key = "u" }) },
}

-- Change color for inactive panes
config.inactive_pane_hsb = {
  saturation = 0.3,
  brightness = 0.3,
}

return config
