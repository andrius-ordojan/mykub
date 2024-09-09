function GetOS()
	local fh = assert(io.popen("uname -o 2>/dev/null", "r"))
	if fh then
		return fh:read() or "Windows"
	end

	return ""
end

local wezterm = require("wezterm")
local config = {}

config.color_scheme = "Vs Code Dark+ (Gogh)"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "zenbones_dark"

config.automatically_reload_config = true

config.hide_tab_bar_if_only_one_tab = true

config.enable_scroll_bar = false
config.scrollback_lines = 10240

if GetOS() == "Darwin" then
	config.font_size = 14
elseif GetOS() == "GNU/Linux" then
	config.font_size = 11
end

config.default_cursor_style = "BlinkingBlock"

config.window_padding = {
	left = 10,
	right = 10,
	top = 20,
	bottom = "1cell",
}

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

config.harfbuzz_features = { "calt=0", "clig=0", "liga=0", "zero" }

config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font Mono",
	"JetBrains Mono",
})

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{ key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
	{ key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
	{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
	{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
	{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
}

config.mouse_bindings = {
	-- Copy text on selection
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action({
			CompleteSelection = "ClipboardAndPrimarySelection",
		}),
	},
	-- Paste on right click
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}

return config
