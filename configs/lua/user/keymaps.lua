local status_ok, wk = pcall(require, 'which-key')
if not status_ok then
  return
end

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local map = vim.api.nvim_set_keymap

map('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--  normal_mode = 'n',
--  insert_mode = 'i',
--  visual_mode = 'v',
--  visual_block_mode = 'x',
--  term_mode = 't',
--  command_mode = 'c'

-- All --
map('', '<F6>', ':NvimTreeToggle<CR>', opts)

local n_opts = {
  mode = 'n',
  noremap = true,
  silent = true,
}

-- Normal --
wk.register({
  ['<leader>'] = {
    -- Window
    w = {
      name = 'Window',
      -- Movement
      h = { '<C-w>h', 'Window left' },
      j = { '<C-w>j', 'Window down' },
      k = { '<C-w>k', 'Window up' },
      l = { '<C-w>l', 'Window right' },
      ['<Left>'] = { '<C-w>h', 'Window left' },
      ['<Down>'] = { '<C-w>j', 'Window down' },
      ['<Up>'] = { '<C-w>k', 'Window up' },
      ['<Right>'] = { '<C-w>l', 'Window right' },

      -- Splits
      s = { '<CMD>split<CR>', 'Horisontal split' },
      v = { '<CMD>vsplit<CR>', 'Vertical split' },

      c = { '<CMD>quit<CR>', 'Close window' },
    },

    -- File
    f = {
      name = "File",
      n = { '<CMD>enew<CR>', 'New file' },
      r = { '<CMD>Telescope oldfiles<CR>', 'Recent files'},
      f = { '<CMD>Telescope find_files<CR>', 'Find file'},
      l = { '<CMD>Telescope live_grep<CR>', 'Find line'},
      p = { '<CMD>e ~/.config/nvim/lua/user<CR>', 'Open configs' },
    },

    -- Buffer
    b = {
      name = "Buffer",
      b = { '<CMD>Telescope buffers<CR>', 'List buffers' },
    },

    -- Toggle
    t = {
      name = 'Toggle',
      t = { '<CMD>ToggleTerm<CR>', 'Terminal' },
    },

    -- Git
    g = {
      name = 'Git',
      c = { '<CMD>Telescope git_commits<CR>', 'Commits' },
      b = { '<CMD>Telescope git_branches<CR>', 'Branches' },
    },

    -- Help
    h = {
      name = 'Help',
      t = { '<CMD>Telescope help_tags<CR>', 'Tags' },
      k = { '<CMD>Telescope keymaps<CR>', 'Keymaps' },
    },

    e = { '<CMD>NvimTreeToggle<CR>', 'Explorer' },
    ['.'] = { '<CMD>lua require("notify").notify("Find file")<CR>', 'Find file'},
  },
}, n_opts)

-- Faster window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-Up>', '<C-w>k', opts)
map('n', '<C-Down>', '<C-w>j', opts)
map('n', '<C-Left>', '<C-w>h', opts)
map('n', '<C-Right>', '<C-w>l', opts)

-- Resize
map('n', '<C-S-Up>', ':resize +2<CR>', opts)
map('n', '<C-S-Down>', ':resize -2<CR>', opts)
map('n', '<C-S-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-S-Right>', ':vertical resize +2<CR>', opts)
map('n', '<C-S-k>', ':resize +2<CR>', opts)
map('n', '<C-S-j>', ':resize -2<CR>', opts)
map('n', '<C-S-h>', ':vertical resize -2<CR>', opts)
map('n', '<C-S-l>', ':vertical resize +2<CR>', opts)

-- Insert --
-- jk fast to exit
map('i', 'jk', '<ESC>', opts)

-- Visual --
-- Indent
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Move text up and down
map('v', '<A-j>', ':m .+1<CR>==', opts)
map('v', '<A-k>', ':m .-2<CR>==', opts)
map('v', '<A-Down>', ':m .+1<CR>==', opts)
map('v', '<A-Up>', ':m .-2<CR>==', opts)

map('v', 'p', '"_dP', opts)

-- Visual Block --
-- Move text up and down
map('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
map('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)
map('x', '<A-Down>', ":move '>+1<CR>gv-gv", opts)
map('x', '<A-Up>', ":move '<-2<CR>gv-gv", opts)

-- Terminal --
map('t', '<ESC>', '<C-\\><C-N>', opts)

-- Quick Movement
map('t', '<C-h>', '<C-\\><C-N><C-w>h', opts)
map('t', '<C-j>', '<C-\\><C-N><C-w>j', opts)
map('t', '<C-k>', '<C-\\><C-N><C-w>k', opts)
map('t', '<C-l>', '<C-\\><C-N><C-w>l', opts)
map('t', '<C-Up>', '<C-\\><C-N><C-w>k', opts)
map('t', '<C-Down>', '<C-\\><C-N><C-w>j', opts)
map('t', '<C-Left>', '<C-\\><C-N><C-w>h', opts)
map('t', '<C-Right>', '<C-\\><C-N><C-w>l', opts)
