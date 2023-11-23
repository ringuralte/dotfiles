-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'

-- Font
config.font = wezterm.font 'Iosevka Term SS14 Medium'
-- config.font = wezterm.font 'JetBrains Mono NF Medium'
config.font_size = 12.0

-- keys
config.keys = {
  {
    key = '{',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = '}',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
}

-- and finally, return the configuration to wezterm
return config

