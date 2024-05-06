-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font ('OpenDyslexicM Nerd Font', { italic = false, })
config.font_size=14.0
-- For example, changing the color scheme:
config.color_scheme = 'One Dark (Gogh)'

config.use_fancy_tab_bar = true
config.unicode_version = 14
config.warn_about_missing_glyphs = false
-- Spawn a powershell 7 in login mode
config.default_prog = { 'pwsh' }
-- and finally, return the configuration to wezterm
return config
