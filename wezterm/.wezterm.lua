local wezterm = require('wezterm')

local config = wezterm.config_builder()
local action = wezterm.action

config.default_prog = { 'pwsh', '-NoLogo' }

config.show_new_tab_button_in_tab_bar = false
config.window_decorations = 'INTEGRATED_BUTTONS'
config.window_padding = { left = 0, right = 0, top = 5, bottom = 0, }

config.font = wezterm.font('MonaspiceNe Nerd Font', { weight = 'Medium' })
config.color_scheme = 'rose-pine'

config.keys = {
    {
        key = 'r',
        mods = 'CTRL|SHIFT',
        action = action.PromptInputLine({
            description = 'New name for tab',
            action = wezterm.action_callback(function(window, _, text)
                window:active_tab():set_title(text)
            end),
        })
    },
    {
        key = 'w',
        mods = 'CTRL|SHIFT|ALT',
        action = action.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }),
    },
    {
        key = '{',
        mods = 'CTRL|SHIFT',
        action = action.SwitchWorkspaceRelative(-1)
    },
    {
        key = '}',
        mods = 'CTRL|SHIFT',
        action = action.SwitchWorkspaceRelative(1),
    },
    {
        key = 'x',
        mods = 'CTRL|SHIFT|ALT',
        action = action.CloseCurrentPane({ confirm = true }),
    }
}

return config
