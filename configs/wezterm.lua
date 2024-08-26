-- Pull in the wezterm API and init objects
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

-- Appearance ---------------------------------------------------

-- Font
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold", italic = false })

-- Tab bar styling
config.use_fancy_tab_bar = true
config.window_frame = {
	active_titlebar_bg = "#1B1825",
	inactive_titlebar_bg = "#1B1825",
	font_size = 12.0,
}

-- Custom colors
config.colors = {
	cursor_bg = "#FF9E3B",
	cursor_border = "#FF9E3B",
	cursor_fg = "000000",
	background = "#1B1825",
	tab_bar = {
		inactive_tab_edge = "None",
		active_tab = {
			bg_color = "#3C3E50",
			fg_color = "#ffffff",
		},
		inactive_tab = {
			bg_color = "#1B1825",
			fg_color = "#DCD7BA",
		},
	},
}

-- Window settings
config.window_background_opacity = 0.94
config.macos_window_background_blur = 80
config.window_decorations = "RESIZE"

-- Keymaps --------------------------------------------------------

config.keys = {
	-- Turn off the default CMD-m Hide action, allowing CMD-m to
	-- be potentially recognized and handled by the tab
	{
		key = "h",
		mods = "CMD|SHIFT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CMD|SHIFT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "|",
		mods = "CMD|SHIFT",
		action = act.SplitPane({
			direction = "Right",
			size = { Percent = 50 },
		}),
	},
	{
		key = ")",
		mods = "CMD|SHIFT",
		action = act.MoveTabRelative(1),
	},
	{
		key = "(",
		mods = "CMD|SHIFT",
		action = act.MoveTabRelative(-1),
	},
}

return config
