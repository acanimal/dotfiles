local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Batman'
config.enable_scroll_bar = true
config.font = wezterm.font 'Hack Nerd Font Mono'
config.font_size = 14
config.hide_mouse_cursor_when_typing = true
config.initial_rows = 40
config.initial_cols = 180
config.switch_to_last_active_tab_when_closing_tab = true

return config
