local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
	return
end

formatter.setup({
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		html = {
			require("formatter.filetypes.html").prettier,
		},
		svelte = {
			require("formatter.filetypes.svelte").prettier,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
		yaml = {
			require("formatter.filetypes.yaml").prettier,
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePost", { command = "FormatWrite" })
