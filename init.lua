-- [[ init.lua ]]--

--{{{ Imports
require('vars')    -- Variables
require('opts')    -- Options
require('keymaps') -- Keymaps
require('plugins') -- Plugins
require('colorscheme')  -- Colorscheme
require('completion')   -- Completion
require('functions')    -- Custom Vim Functions
require('keymaps')      -- Key Mapping
require('aucommands')   -- auto commands
require('autopairs')    -- auto pairing
require('tabline')      -- BufferLine Tab Line
require('statusline')   -- Lualine Status Line
require('lspsetup')     -- LSP setup
require('tssetup')      -- telescope setup
require('luasnip-config')   -- LuaSnip Config
--}}} Imports

--{{{ nvim-tree
require('nvim-tree').setup{}
--}}} nvim-tree

--{{{ Ale
vim.cmd [[
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚠'
    highlight ALEErrorSign guibg=black guifg=red
    highlight ALEWarningSign guibg=black guifg=yellow
    let g:ale_linters_explicit = 1
    let g:ale_lint_on_text_changed = 'never'
    let g:ale_lint_on_enter = 1
    let g:ale_lint_on_save = 1
    let g:ale_fix_on_save = 0
    let g:ale_linters = {
            \ 'bash': ['shellcheck'],
            \ 'c': ['cc'],
            \ 'cpp': ['cc'],
            \ 'dart': ['dart'],
            \ 'go': ['golint'],
            \ 'javascript': ['eslint'],
            \ 'markdown': ['mdl', 'writegood', 'proselint'],
            \ 'vimwiki': ['mdl', 'writegood', 'proselint'],
            \ 'pandoc': ['mdl', 'writegood', 'proselint'],
            \ 'python': ['flake8'],
            \ 'rust': ['cargo', 'rust_analyzer'],
            \ 'sh': ['language_server', 'shellcheck'],
            \ }
    let g:ale_fixers = {
                \ 'c': ['astyle'],
                \ 'cpp': ['astyle'],
                \ 'dart': ['dartfmt'],
                \ 'go': ['gofmt'],
                \ 'python': ['yapf'],
                \ '*': ['remove_trailing_lines', 'trim_whitespace'],
                \ }
]]
-- --}}} Ale

--{{{ Markdown
vim.g.markdown_mdl_executable = 'mdl'
vim.g.markdown_mdl_options = ''
---}}} Markdown

--{{{ Table Mode
vim.cmd [[
    " Markdown-compatible tables with vim-table-mode
    let g:table_mode_corner = '|'
]]
--}}} Table Mode

--{{{ Wrap conditions
vim.cmd [[
set whichwrap=b,s,h,l,<,>,[,]
]]
--}}} Wrap conditions
