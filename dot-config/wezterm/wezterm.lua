local options = require("options")
local fonts = require("fonts")
local bindings = require("bindings")
local events = require("events")

local config = require("wezterm").config_builder()

options.apply_config(config)
bindings.apply_config(config)
fonts.apply_config(config)
events.apply()

return config
