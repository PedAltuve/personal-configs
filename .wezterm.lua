-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.keys = {
	-- Make Option-Left equivalent to Alt-b (backward-word)
    {
        key = 'LeftArrow',
        mods = 'OPT',
        action = wezterm.action.SendString '\x1bb',
    },
    -- Make Option-Right equivalent to Alt-f (forward-word)
    {
        key = 'RightArrow',
        mods = 'OPT',
        action = wezterm.action.SendString '\x1bf',
    },
}
-- For example, changing the color scheme:
config.color_scheme = 'Chameleon (Gogh)'
-- config.color_scheme = 's3r0 modified (terminal.sexy)'
config.font_size = 20

-- and finally, return the configuration to wezterm
return config
