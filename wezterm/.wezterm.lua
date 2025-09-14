local wezterm = require("wezterm")

-- Event: bei jeder SSH-Verbindung automatisch tmux attach/new
wezterm.on("ssh-domain-connect", function(window, pane, ssh)
	local host = ssh.hostname or ""

	-- falls Host in 192.168.178.x liegt
	if host:match("^192%.168%.178%.%d+$") then
		-- Session-Name = letzte Zahl der IP (z.B. 192.168.178.64 → session=64)
		local session = host:match("(%d+)$") or "home"
		local cmd = string.format("tmux attach -t %s || tmux new -s %s\n", session, session)
		window:perform_action(wezterm.action.SendString(cmd), pane)
	end
end)

-- Erscheinungsbild und Keybinds
return {

	front_end = "WebGpu",

	font = wezterm.font_with_fallback({
		"JetBrainsMono Nerd Font",
		"FiraCode Nerd Font",
	}),
	font_size = 13.0,
	color_scheme = "Tokyo Night",
	window_background_opacity = 1.0,

	--ssh_Domains

	ssh_domains = {
		{
			name = "pve64",
			remote_address = "192.168.178.64",
			username = "root",
		},
	},

	-- Tabs
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,

	-- ⚡ Leader-Key wie tmux (Ctrl+a)
	leader = { key = "a", mods = "CTRL" },

	keys = {
		-- Splits
		{ key = "-", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "|", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		-- Tabs
		{ key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		{ key = "n", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "p", mods = "LEADER", action = wezterm.action({ ActivateTabRelative = -1 }) },
		-- Pane-Navigation (vim-style)
		{ key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		-- Extras
		{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
		{ key = "r", mods = "LEADER", action = wezterm.action.ReloadConfiguration },
		{ key = "f", mods = "LEADER", action = wezterm.action.ToggleFullScreen },
	},
}
