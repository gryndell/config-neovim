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
keymap('n', '<leader>u', ':nohls<cr>', opts)

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

-- LSP Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

