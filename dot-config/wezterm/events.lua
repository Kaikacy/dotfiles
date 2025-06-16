local wt = require("wezterm")

local function tab_title(tab_info)
	local title = tab_info.tab_title
	if title and #title > 0 then
		return title
	end
	return tab_info.active_pane.title
end

local M = {}

function M.apply()
	wt.on("update-right-status", function(window, pane)
		local leader = window:leader_is_active()
				and wt.format({
					{ Attribute = { Intensity = "Bold" } },
					{ Foreground = { Color = "gold" } },
					{ Text = "LEADER " },
				})
			or ""

		local active_table = window:active_key_table()
		active_table = active_table
				and wt.format({
					{ Attribute = { Intensity = "Bold" } },
					{ Foreground = { Color = "turquoise" } },
					{ Text = active_table .. " " },
				})
			or ""
		window:set_right_status(leader .. active_table)
	end)

	wt.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
		local title = tab_title(tab)
		local title_fmt = (tab.active_pane.is_zoomed and "  [Z] " or "  ") .. title .. "  "
		if tab.is_active then
			return {
				{ Background = { AnsiColor = "Black" } },
				{ Text = title_fmt },
			}
		end
		return title_fmt
	end)
end

return M
