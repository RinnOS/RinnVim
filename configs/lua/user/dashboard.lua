local status_ok, db = pcall(require, 'dashboard')
if not status_ok then
  return
end

local home = os.getenv('HOME')

-- db.preview_file_path = home .. '/.config/nvim/static/picture'
-- db.preview_file_height = 12
-- db.preview_file_width = 80
db.custom_center = {
  { icon = ' ',
  desc = 'Recent files                  ',
  shortcut = 'SPC f r',
  action = 'Telescope oldfiles'},
  { icon = ' ',
  desc = 'Configs location              ',
  shortcut = 'SPC f p',
  action = 'e ~/.config/nvim/lua/user'},
}
