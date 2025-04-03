-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Tokyo Night Moon'
-- config.color_scheme = 'PaperColor Dark (base16)'
config.color_scheme = "Papercolor Dark (Gogh)"
-- config.color_scheme = 'Vs Code Dark+ (Gogh)'

config.default_prog = { "powershell.exe" }
-- config.front_end = 'Software'

config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"

config.window_background_opacity = 0.9

config.integrated_title_button_style = "Windows"
config.integrated_title_button_color = "auto"
config.integrated_title_button_alignment = "Right"
-- initial_cols = 120,
-- initial_rows = 24,
config.window_padding = {
	left = 5,
	right = 10,
	top = 12,
	bottom = 7,
}

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.7,
}

config.disable_default_key_bindings = true

-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = '"',
		mods = "LEADER|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "%",
		mods = "LEADER|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	{
		key = "h",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "x",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "z",
		mods = "LEADER",
		action = act.TogglePaneZoomState,
	},
	-- { key = "T", mods = "SHIFT|CTRL", action = act.ShowLauncher },
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "&",
		mods = "LEADER|SHIFT",
		action = act.CloseCurrentTab({ confirm = true }),
	},
	{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	{ key = "V", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },

	{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{
		key = "a",
		mods = "LEADER|CTRL",
		action = act.SendKey({ key = "a", mods = "CTRL" }),
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

-- and finally, return the configuration to wezterm
return config
