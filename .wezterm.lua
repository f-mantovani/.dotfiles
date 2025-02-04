local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.default_prog = { "nu" }
config.color_scheme = 'tokyonight'

config.font = wezterm.font {
    family = 'FiraCode Nerd Font Mono',
    harfbuzz_features = { 'calt=1', 'liga=1', 'clig=1', 'cv13', 'cv31', 'cv16', 'cv18', 'ss05' }
}

config.window_background_opacity = 0.95
-- config.win32_system_backdrop = 'Tabbed'
-- config.macos_window_background_blur = 20

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.front_end = "WebGpu"

config.use_fancy_tab_bar = true

config.keys = {
    {
        key = "l",
        mods = "SHIFT|ALT",
        action = act.SplitVertical {
            domain = 'CurrentPaneDomain',
        },
    },
    {
        key = "d",
        mods = "SHIFT|ALT",
        action = act.SplitHorizontal {
            domain = 'CurrentPaneDomain',
        },
    },
    {
        key = "LeftArrow",
        mods = "ALT",
        action = act.ActivatePaneDirection "Left",
    },
    {
        key = "RightArrow",
        mods = "ALT",
        action = act.ActivatePaneDirection "Right",
    },
    {
        key = "UpArrow",
        mods = "ALT",
        action = act.ActivatePaneDirection "Up",
    },
    {
        key = "DownArrow",
        mods = "ALT",
        action = act.ActivatePaneDirection "Down",
    },
    {
        key = 'LeftArrow',
        mods = 'CTRL|SHIFT',
        action = act.AdjustPaneSize { 'Left', 5 },
    },
    {
        key = 'DownArrow',
        mods = 'CTRL|SHIFT',
        action = act.AdjustPaneSize { 'Down', 5 },
    },
    { key = 'UpArrow', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize { 'Up', 5 } },
    {
        key = 'RightArrow',
        mods = 'CTRL|SHIFT',
        action = act.AdjustPaneSize { 'Right', 5 },
    },
}

wezterm.on(
    'format-tab-title',
    function(tab, tabs, panes, config, hover, max_width)
        -- Obtém o título do pane ativo (geralmente o caminho do diretório)
        local title = tab.active_pane.title
        local before_symbol = wezterm.nerdfonts.cod_chevron_right

        -- Verifica se o título foi obtido
        if title then
            -- Extrai o último diretório do caminho usando uma expressão regular
            local last_dir = title:match("([^/\\]+)/*$")

            -- Se a aba for ativa, formate o título com fundo ciano e a seta
            if tab.is_active then
                return {
                    { Background = { Color = 'cyan' } },
                    { Foreground = { Color = 'black' } },
                    { Text = before_symbol },
                    { Text = ' ' .. last_dir .. ' ' },
                }
            end

            -- Para abas não ativas, retorna o último diretório
            return last_dir
        end

        -- Caso o título não seja encontrado, retorna "unknown"
        return "unknown"
    end
)

return config
