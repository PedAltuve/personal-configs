-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Spacedust'
-- config.color_scheme = 's3r0 modified (terminal.sexy)'
config.font_size = 20

-- and finally, return the configuration to wezterm
return config
