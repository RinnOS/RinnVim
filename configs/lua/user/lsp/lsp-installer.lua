local installer_status_ok, installer = pcall(require, 'mason-lspconfig')
if not installer_status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status_ok then
  return
end

installer.setup({
  ensure_installed = {
    'bashls',
    'cssls',
    'html',
    'jsonls',
    'tsserver',
    'sumneko_lua',
    'sqlls',
    'svelte',
    'taplo',
    'tailwindcss',
    'yamlls',
  }
})

installer.setup_handlers {
  function(server_name)
    local opts = {
      capabilities = require('user.lsp.handlers').capabilities,
      on_attach = require('user.lsp.handlers').on_attach,
    }

    if server_name == 'sumneko_lua' then
      opts = vim.tbl_deep_extend(
        'force',
        require('user.lsp.settings.sumneko_lua'),
        opts
      )
    end

    if server_name == 'jsonls' then
      opts = vim.tbl_deep_extend(
        'force',
        require('user.lsp.settings.jsonls'),
        opts
      )
    end

    lspconfig[server_name].setup(opts)
  end,
}
