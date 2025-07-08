local M = {}

function M.apply_config(config)
	config.adjust_window_size_when_changing_font_size = false
	config.animation_fps = 1
	config.cursor_blink_rate = 0
	config.bold_brightens_ansi_colors = false
	config.char_select_bg_color = "#111111"
	config.command_palette_bg_color = "#111111"
	config.enable_kitty_keyboard = true
	config.enable_scroll_bar = true
	config.quick_select_remove_styling = true
	config.show_close_tab_button_in_tabs = false
	config.show_new_tab_button_in_tab_bar = false
	config.use_fancy_tab_bar = false
	config.show_tab_index_in_tab_bar = false
	config.tab_max_width = 60
	config.tab_bar_at_bottom = true
	config.warn_about_missing_glyphs = false
	config.window_padding = {
		left = "5px",
		top = "5px",
		right = "0",
		bottom = "0",
	}
	config.color_scheme = "deep" -- deep, Wez
	config.colors = {
		compose_cursor = "gold",
	}
end

return M
