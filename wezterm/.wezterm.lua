local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local act = wezterm.action

config.default_prog = { 'pwsh' }

config.show_new_tab_button_in_tab_bar = false
config.window_decorations = 'INTEGRATED_BUTTONS'
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0, }

config.font = wezterm.font('MonaspiceNe Nerd Font', { weight = 'Medium' })
config.color_scheme = 'rose-pine'

config.keys = {
    {
        key = 'R',
        mods = 'CTRL|SHIFT',
        action = act.PromptInputLine({
            description = 'New name for tab',
            action = wezterm.action_callback(function(window, _, text)
                window:active_tab():set_title(text)
            end),
        })
    },
}

return config
