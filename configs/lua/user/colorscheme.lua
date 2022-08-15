-- Available themes: calvera, tokyodark, moonlight, moonfly, neon, material, codedark, nightfly, zephyr, 
local theme = 'neon'

-- Uncomment if using theme neon
-- Available styles: default, doom, dark, light
local neon_style = 'dark'

-- Uncomment if using theme material
-- Available styles: darker, lighter, oceanic, palenight, deep ocean
local material_style = 'deep ocean'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. theme)
if not status_ok then
  return
end

local material_status_ok, _ = pcall(vim.cmd, 'colorscheme material')
if material_status_ok then
  vim.g.material_style = material_style or 'darker'
  require('material').setup({
    italics = {
      comments = true,
    },
  })
end

local neon_status_ok, _ = pcall(vim.cmd, 'colorscheme neon')
if neon_status_ok then
  vim.g.neon_style = neon_style or 'default'
  vim.g.neon_italic_comment = true
end

local moon_status_ok, _ = pcall(vim.cmd, 'colorscheme moonlight')
if moon_status_ok then
  vim.g.moonlight_italic_comments = true
end

local tokyodark_status_ok, _ = pcall(vim.cmd, 'colorscheme tokyodark')
if tokyodark_status_ok then
  vim.g.tokyodark_enable_italic_comment = true
end

local calvera_status_ok, _ = pcall(vim.cmd, 'colorscheme calvera')
if calvera_status_ok then
  vim.g.calvera_italic_comments = true
end

vim.cmd('colorscheme ' .. theme)
