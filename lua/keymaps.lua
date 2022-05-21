--[[ keymaps.lua ]]--
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Short name for nvim_set_keymap
local keymap = vim.api.nvim_set_keymap

--{{{ Leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--}}} Leader

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Easy return to normal mode
keymap('i', 'jk', '<esc>', {})

--{{{ Terminal
keymap('n', '<leader>tv', ':vertical terminal<cr>', opts)
keymap('n', '<leader>th', ':terminal<cr>', opts)
--}}} Terminal

-- When sudo is needed
keymap('c', 'w!!', '%!sudo tee > /dev/null %', opts)

-- Turn off highlight search
keymap('n', '<leader>u', ':nohls', opts)

-- Disable arrow movement, move between windows instead
keymap('n', '<up>', '<c-w>k', opts)
keymap('n', '<down>', '<c-w>j', opts)
keymap('n', '<left>', '<c-w>h', opts)
keymap('n', '<right>', '<c-w>l', opts)
keymap('n', '<c-up>', ':resize -1<cr>', opts)
keymap('n', '<c-down>', ':resize +1<cr>', opts)
keymap('n', '<c-left>', ':vertical resize -1<cr>', opts)
keymap('n', '<c-right>', ':vertical resize +1<cr>', opts)

-- Move lines vertically in visual mode
keymap('x', 'K', ':call Move_Up()<cr>', opts)
keymap('x', 'J', ':call Move_Down()<cr>', opts)

-- Move lines horizontally in visual mode
keymap('x', '<space>', ':s/^/ /<cr>:nohls<cr>gv', opts)
keymap('x', '<bs>', ':s/^ //<cr>:nohls<cr>gv', opts)

-- Preserve selection when indenting in visual mode
keymap('x', '>', '>gv', opts)
keymap('x', '<', '<gv', opts)

-- Switch buffer
keymap('n', '<c-PageDown>', ':bn!<cr>', opts)
keymap('n', '<c-PageUp>', ':bp!<cr>', opts)

-- Mappings for date/time
keymap('n', '<f4>', '=strftime("%H:%M")<cr>p', opts)
keymap('i', '<f4>', '<c-r>=strftime("%H:%M)<cr>', opts)
keymap('n', '<f5>', '=strftime("%F")<cr>p', opts)
keymap('i', '<f5>', '<c-r>=strftime("%F")<cr>', opts)

-- Quotes around
keymap('n', '<leader>"', 'viw<esc>a"<esc>bi"<esc>lel', opts)
keymap("n", "<leader>'", "viw<esc>a'<esc>bi'<esc>lel", opts)
keymap('v', '<leader>"', '<esc>`>a"<esc>`<i"<esc>', opts)
keymap('v', "<leader>'", "<esc>`>a'<esc>`<i'<esc>", opts) 

-- Toggle number settings
keymap('n', '<leader>n', ':call ToggleNumber()<cr>', opts)

-- Run SmartHome with Home key
keymap('n', '<expr>', '<Home> SmartHome()', opts)
keymap('i', '<Home>', '<c-o><Home>', term_opts)

-- Toggle fold
keymap('n', '<f7>', 'za', opts)
-- Toggle all folds
keymap('n', '<f8>', ':call ToggleFolded()<cr>', opts)

-- Toggle ConcealLevel
keymap('n', '<f9>', ':call ToggleConceal()<cr>', opts)

-- Toggle Spelling
keymap('n', '<leader>o', ':setlocal spell!<cr>', opts)

-- Auto correct last spelling error
keymap('n', '<leader>ac', ':call AutoCorrect()<cr>', opts)
