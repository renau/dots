-- Pull in the wezterm API
local wezterm = require("wezterm")

local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"

-- Define your color schemes
local light_scheme = 'Material'  -- or any light scheme you prefer
local dark_scheme = 'Espresso'    -- or any dark scheme you prefer

wezterm.on('format-tab-title', function(tab)
  local title = tab.active_pane.title
  local uv = tab.active_pane.user_vars
  local attention = uv and uv.attention == "1"

  if attention then
    -- Prefix marker without mutating the underlying tab title
    return {
      { Text = '⚠ ' .. title },
    }
  end

  return title
end)

-- Function to toggle between light and dark themes
wezterm.on('toggle-colorscheme', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if overrides.color_scheme == light_scheme then
    overrides.color_scheme = dark_scheme
  else
    overrides.color_scheme = light_scheme
  end
  window:set_config_overrides(overrides)
end)

config.color_scheme = light_scheme
config.font = wezterm.font("Inconsolata")
-- config.font = wezterm.font("Monaco")
-- config.font = wezterm.font("Hack")
-- config.font = wezterm.font("Fira Code")
-- config.font = wezterm.font("JetBrains Mono")
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.disable_default_key_bindings = true
config.enable_tab_bar = true
-- config.default_cursor_style = "SteadyUnderline"
config.window_decorations = "RESIZE"

config.keys = {
  { key = "RightArrow", mods = "CMD|SHIFT", action = act.ActivateTabRelative(1)},
  {key="Enter", mods="SHIFT", action=wezterm.action{SendString="\x1b\r"} },
	{ key = "LeftArrow", mods = "CMD|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "UpArrow", mods = "CMD", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CMD", action = act.ActivatePaneDirection("Down") },
	{ key = "LeftArrow", mods = "CMD", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CMD", action = act.ActivatePaneDirection("Right") },

  { key = "C", mods  ="CMD", action = act.EmitEvent 'toggle-colorscheme' },

	{ key = "1", mods = "CMD", action = act.ActivateTab(0) },
	{ key = "2", mods = "CMD", action = act.ActivateTab(1) },
	{ key = "3", mods = "CMD", action = act.ActivateTab(2) },
	{ key = "4", mods = "CMD", action = act.ActivateTab(3) },
	{ key = "5", mods = "CMD", action = act.ActivateTab(4) },
	{ key = "6", mods = "CMD", action = act.ActivateTab(5) },
	{ key = "7", mods = "CMD", action = act.ActivateTab(6) },
	{ key = "8", mods = "CMD", action = act.ActivateTab(7) },
	{ key = "9", mods = "CMD", action = act.ActivateTab(8) },

	-- { key = "Enter", mods = "CMD", action = act.ActivateCopyMode },
	{ key = "R", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
	{ key = "+", mods = "CMD", action = act.IncreaseFontSize },
	{ key = "-", mods = "CMD", action = act.DecreaseFontSize },
	{ key = "0", mods = "CMD", action = act.ResetFontSize },

	{ key = "c", mods = "CMD", action = act.CopyTo("Clipboard") },
	{ key = "v", mods = "CMD", action = act.PasteFrom("Clipboard") },

	{
		key = "U",
		mods = "SHIFT|CTRL",
		action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
	},

	{ key = "v", mods = "SHIFT|CMD", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "t", mods = "SHIFT|CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "Enter", mods = "CMD", action = act.SpawnWindow },
	{ key = "z", mods = "CMD", action = wezterm.action.TogglePaneZoomState },

	{ key = "h", mods = "CMD", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CMD", action = act.ActivatePaneDirection("Right") },
	-- { key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = false }) },
	-- { key = "x", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "b", mods = "LEADER|CTRL", action = act.SendString("\x02") },
	{ key = "Enter", mods = "LEADER", action = act.ActivateCopyMode },
	-- { key = "p", mods = "LEADER", action = act.PastePrimarySelection },
	{
		key = "k",
		mods = "CTRL|ALT",
		action = act.Multiple({
			act.ClearScrollback("ScrollbackAndViewport"),
			act.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
}
-- and finally, return the configuration to wezterm
return config
