local status_ok, tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

tree.setup({
  sort_by = 'name',
  sync_root_with_cwd = true,
  view = {
    width = 20,
  },
  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
    },
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  }
})
