local wezterm = require("wezterm")
local config = require("config")
require("events")

-- Apply color scheme based on the WEZTERM_THEME environment variable
local themes = {
	nord = "Nord (Gogh)",
	onedark = "One Dark (Gogh)",
}
local success, stdout, stderr = wezterm.run_child_process({ os.getenv("SHELL"), "-c", "printenv WEZTERM_THEME" })
local selected_theme = stdout:gsub("%s+", "") -- Remove whitespace
config.color_scheme = themes[selected_theme]

-- ✅ Add transparency and blur settings here (final layer)
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE" -- allows blur/opacity
config.window_background_opacity = 0.85
config.macos_window_background_blur = 20

-- Optional: ensure background layering order is correct
config.background = {
	{
		source = {
			File = "/Users/" .. os.getenv("USER") .. "/Pictures/ravens.jpg",
		},
		opacity = 0.5, -- controls image transparency
		hsb = {
			brightness = 0.25,
		},
	},
	{
		source = { Color = "#000000" },
		width = "100%",
		height = "100%",
		opacity = 0.15, -- dim overlay to make text readable
	},
}

return config


-- **********************************************************************************************************************

-- local wezterm = require("wezterm")
-- local config = require("config")
-- require("events")

-- -- Apply color scheme based on the WEZTERM_THEME environment variable
-- local themes = {
-- 	nord = "Nord (Gogh)",
-- 	onedark = "One Dark (Gogh)",
-- }
-- local success, stdout, stderr = wezterm.run_child_process({ os.getenv("SHELL"), "-c", "printenv WEZTERM_THEME" })
-- local selected_theme = stdout:gsub("%s+", "") -- Remove all whitespace characters including newline
-- config.color_scheme = themes[selected_theme]

-- return config






-- ************************************************************************************************************************************






-- local wezterm = require("wezterm")

-- config = wezterm.config_builder()

-- config = {
--     automatically_reload_config = true,
--     enable_tab_bar = false,
--     window_close_confirmation = "NeverPrompt",
--     window_decorations = "RESIZE", --disable title bar but enable resizing
--     default_cursor_style = "BlinkingBar",
--     color_scheme = "Nord (Gogh)",
--     font = wezterm.font("JetBrains Mono", { weight = "Bold" }
--     font_size = 12.5,
--     background = {
--     {
--         source = {
--             File = "/Users/dayobbadru/Pictures/ravens.jpg",
--         },
--         hsb = {
--             hue = 1.0,
--             saturation = 1.02,
--             brightness = 0.25,
--         },
--         width = "100%",
--         height = "100%",
--     },
--     {
--         source = {
--             Color = "#282c35",
--         },
--         width = "100%",
--         height = "100%",
--         opacity = 0.75,
--     },
-- },
--     window_padding = {
--         left = 3,
--         right = 3,
--         top = 0,
--         bottom = 0,
--     },

-- }

-- return config