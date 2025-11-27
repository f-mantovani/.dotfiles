local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local config = {}

-- config.font = wezterm.font({
-- 	family = "FiraCode Nerd Font Mono",
-- 	harfbuzz_features = { "calt=1", "liga=1", "clig=1", "cv13", "cv31", "cv16", "cv18", "ss05" },
-- 	weight = "Regular",
-- })

-- config.default_prog = { "nu", "--config", "C:\\Users\\Felipe\\.dotfiles\\config.nu" }
config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe" }
config.color_scheme = "tokyonight"

config.font = wezterm.font("0xProto Nerd Font", { weight = "Light" })

local opacity = 0.00
config.window_background_opacity = opacity
config.win32_system_backdrop = "Mica"

config.window_decorations = "RESIZE"
config.integrated_title_button_style = "Gnome"
config.front_end = "WebGpu"

config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true

config.keys = {
	{
		key = "d",
		mods = "CTRL|SHIFT",
		action = act.SplitVertical({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		key = "r",
		mods = "CTRL|SHIFT",
		action = act.SplitHorizontal({
			domain = "CurrentPaneDomain",
		}),
	},
	{
		mods = "SHIFT|ALT",
		key = "n",
		action = act.SpawnTab("DefaultDomain"),
	},
	{
		mods = "SHIFT|ALT",
		key = "x",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "LeftArrow",
		mods = "SHIFT|ALT",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "RightArrow",
		mods = "SHIFT|ALT",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "LeftArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "DownArrow",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "UpArrow", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
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
				{ Background = { Color = "cyan" } },
				{ Foreground = { Color = "black" } },
				{ Text = before_symbol },
				{ Text = " " .. last_dir .. " " },
			}
		end

		-- Para abas não ativas, retorna o último diretório
		return last_dir
	end

	-- Caso o título não seja encontrado, retorna "unknown"
	return "unknown"
end)

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
