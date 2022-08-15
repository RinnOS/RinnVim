local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local installed_packages = require("mason-registry").get_installed_packages()

-- :Mason
-- Press 5 to get names of all formatters
local formatters = {
	"prettier",
	"stylua",
}

for _, formatter in ipairs(formatters) do
	if not require("mason-registry").is_installed(formatter) then
		local cmd = "MasonInstall " .. formatter
		vim.cmd(cmd)
	end
end
