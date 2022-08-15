local o = vim.opt

o.backup = false
o.clipboard = 'unnamedplus'
o.cmdheight = 1
o.fileencoding = 'utf-8'
o.mouse = 'a'
o.pumheight = 10
o.showtabline = 2
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.swapfile = true
o.timeoutlen = 1000
o.undofile = true
o.updatetime = 300
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.cursorline = true
o.number = true
o.numberwidth = 4
o.wrap = true
o.guifont = 'monospace:h17'
o.termguicolors = true

o.shortmess:append 'c'

vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd [[set iskeyword+=-]]

vim.api.nvim_create_autocmd(
  'BufEnter',
  { command = 'set formatoptions-=cro'}
)
