local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

configs.setup {
  ensure_installed = 'all',
  sync_install = false,
  auto_install = true,
  ignore_install = { '' },
  highlight = {
    enable = true,
    additional_vim_regex_highlightning = true,
  },
  indent = { 
    enable = false, 
    disable = { 'yaml' }, 
  },

  -- Plugins
  rainbow = {
    enable = true,
    extended_mode = true,
  },
  autotag = {
    enable = true,
  },
}
