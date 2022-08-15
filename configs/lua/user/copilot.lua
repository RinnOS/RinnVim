local status_ok, notify = pcall(require, 'notify')
if not status_ok then
  return
end

if not io.open(vim.fn.stdpath("config") .. "/../github-copilot/hosts.json", "r") then
	notify(
		"This seems to be the first time you've opened this configuration.\nPlease run ':Copilot' to begin the setup to use Github copilot",
		"error",
		{
			title = "Github Copilot",
			timout = 10000,
		}
	)
end
