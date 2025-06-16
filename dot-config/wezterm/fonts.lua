local wt = require("wezterm")

local main_font_name = "JetbrainsMono Nerd Font"
local emoji_font_name = "Noto Emoji"
local font_with_fallback = wt.font_with_fallback({ main_font_name, emoji_font_name })

local M = {}

function M.apply_config(config)
	config.font = font_with_fallback
	config.command_palette_font = font_with_fallback
	config.char_select_font = font_with_fallback
	config.freetype_load_target = "HorizontalLcd"
	config.font_size = 14.5
end

return M
