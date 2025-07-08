local wt = require("wezterm")
local act = require("wezterm").action

local main_mod = "CTRL|ALT"
local other_mod = "CTRL|SHIFT"

local function bind_key(mods, key, action)
	return {
		mods = mods,
		key = key,
		action = action,
	}
end

local function bind_mouse(mods, event, action, alt_screen)
	return {
		mods = mods,
		event = event,
		action = action,
		alt_screen = alt_screen or "Any",
	}
end

local function active_pane_info(tab)
	for _, item in ipairs(tab:panes_with_info()) do
		if item.is_active then
			return item
		end
	end
end

local M = {}

function M.apply_config(config)
	config.leader = { mods = main_mod, key = "s", timeout_milliseconds = 3000 }
	config.disable_default_key_bindings = true
	config.disable_default_mouse_bindings = true
	config.keys = {
		bind_key(
			"CTRL",
			"c",
			wt.action_callback(function(window, pane)
				local sel = window:get_selection_text_for_pane(pane)
				if not sel or sel == "" then
					window:perform_action(act.SendKey({ key = "c", mods = "CTRL" }), pane)
				else
					window:copy_to_clipboard(sel, "Clipboard")
				end
			end)
		),
		bind_key(other_mod, "V", act.PasteFrom("Clipboard")),
		bind_key(main_mod, "p", act.ActivateCommandPalette),
		bind_key(other_mod, "u", act.CharSelect),
		bind_key(main_mod, ";", act.ShowLauncher),
		bind_key(main_mod, "Escape", act.ShowDebugOverlay),
		bind_key(main_mod, "i", act.QuickSelect),
		bind_key(main_mod, "n", act.SpawnWindow),
		bind_key(other_mod, "_", act.DecreaseFontSize),
		bind_key(other_mod, "+", act.IncreaseFontSize),
		bind_key(other_mod, ")", act.ResetFontSize),
		bind_key(main_mod, " ", act.ActivateCopyMode),
		bind_key(main_mod, "/", act.Search({ CaseInSensitiveString = "" })),
		bind_key(main_mod, "e", act.SpawnTab("CurrentPaneDomain")),
		bind_key(main_mod, "w", act.CloseCurrentPane({ confirm = true })),
		bind_key(main_mod, "[", act.ActivateTabRelative(-1)),
		bind_key(main_mod, "]", act.ActivateTabRelative(1)),
		bind_key(other_mod, "{", act.MoveTabRelative(-1)),
		bind_key(other_mod, "}", act.MoveTabRelative(1)),
		bind_key(other_mod, "R", act.ReloadConfiguration),
		bind_key(
			main_mod,
			"Enter",
			wt.action_callback(function(window, pane)
				local pane_info = active_pane_info(pane:tab())
				if pane_info.pixel_width >= pane_info.pixel_height then
					pane:split({ direction = "Right" })
				else
					pane:split({ direction = "Bottom" })
				end
			end)
		),
		bind_key(main_mod, "h", act.ActivatePaneDirection("Left")),
		bind_key(main_mod, "j", act.ActivatePaneDirection("Down")),
		bind_key(main_mod, "k", act.ActivatePaneDirection("Up")),
		bind_key(main_mod, "l", act.ActivatePaneDirection("Right")),
		bind_key(other_mod, "h", act.AdjustPaneSize({ "Left", 2 })),
		bind_key(other_mod, "j", act.AdjustPaneSize({ "Down", 2 })),
		bind_key(other_mod, "k", act.AdjustPaneSize({ "Up", 2 })),
		bind_key(other_mod, "l", act.AdjustPaneSize({ "Right", 2 })),
		bind_key(main_mod, "m", act.TogglePaneZoomState),
		bind_key(main_mod, "d", act.ScrollByPage(0.5)),
		bind_key(main_mod, "u", act.ScrollByPage(-0.5)),
		bind_key(main_mod, "f", act.ScrollByPage(1)),
		bind_key(main_mod, "b", act.ScrollByPage(-1)),
		bind_key("LEADER", "j", act.ScrollToPrompt(1)),
		bind_key("LEADER", "k", act.ScrollToPrompt(-1)),
		bind_key("LEADER", "G", act.ScrollToBottom),
		bind_key("LEADER", "g", act.ScrollToTop),
		bind_key("LEADER", "[", act.RotatePanes("CounterClockwise")),
		bind_key("LEADER", "]", act.RotatePanes("Clockwise")),
	}
	config.mouse_bindings = {
		bind_mouse("NONE", { Down = { streak = 1, button = "Left" } }, act.SelectTextAtMouseCursor("Cell")),
		bind_mouse("NONE", { Drag = { streak = 1, button = "Left" } }, act.ExtendSelectionToMouseCursor("Cell")),
		bind_mouse("NONE", { Down = { streak = 2, button = "Left" } }, act.SelectTextAtMouseCursor("Word")),
		bind_mouse("NONE", { Drag = { streak = 2, button = "Left" } }, act.ExtendSelectionToMouseCursor("Word")),
		bind_mouse("NONE", { Down = { streak = 3, button = "Left" } }, act.SelectTextAtMouseCursor("Line")),
		bind_mouse("NONE", { Drag = { streak = 3, button = "Left" } }, act.ExtendSelectionToMouseCursor("Line")),
		bind_mouse("ALT", { Down = { streak = 1, button = "Left" } }, act.SelectTextAtMouseCursor("Block")),
		bind_mouse("ALT", { Drag = { streak = 1, button = "Left" } }, act.ExtendSelectionToMouseCursor("Block")),
		bind_mouse(
			"NONE",
			{ Up = { streak = 1, button = "Left" } },
			act.CompleteSelectionOrOpenLinkAtMouseCursor("PrimarySelection")
		),
		bind_mouse("NONE", { Up = { streak = 2, button = "Left" } }, act.CompleteSelection("PrimarySelection")),
		bind_mouse("NONE", { Up = { streak = 3, button = "Left" } }, act.CompleteSelection("PrimarySelection")),
		bind_mouse("ALT", { Up = { streak = 1, button = "Left" } }, act.CompleteSelection("PrimarySelection")),
		bind_mouse("NONE", { Down = { streak = 1, button = "Middle" } }, act.PasteFrom("PrimarySelection")),
		bind_mouse("NONE", { Down = { streak = 1, button = { WheelUp = 1 } } }, act.ScrollByLine(-3), false),
		bind_mouse("NONE", { Down = { streak = 1, button = { WheelDown = 1 } } }, act.ScrollByLine(3), false),
	}
end

return M
