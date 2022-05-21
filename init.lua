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
--}}} Imports

--{{{ nvim-tree
require('nvim-tree').setup{}
--}}} nvim-tree

--{{{ LSP
vim.cmd [[ highlight DiagnosticSignError guifg=red ]]
vim.cmd [[ highlight DiagnosticSignWarn guifg=orange ]]
vim.cmd [[ highlight DiagnosticSignInfo guifg=blue ]]
vim.cmd [[ highlight DiagnosticSignHInt guifg=green ]]
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
require('lspconfig').gopls.setup{}
require('lspconfig').pylsp.setup{}
require('lspconfig').rls.setup{}

local signs = {
    Error = '✗',
    Warn = '⚠',
    Info = '',
    Hint = ''
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
    float = {
        border = "rounded",
        format = function(diagnostic)
            return string.format(
                "%s (%s) [%s]",
                diagnostic.message,
                diagnostic.source,
                diagnostic.code or diagnostic.user_data.lsp.code
            )
        end,
    }
})
--}}} LSP

--{{{ Ale
vim.cmd [[
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚠'
    highlight ALEErrorSign guibg=NONE guifg=red
    highlight ALEWarningSign guibg=NONE guifg=yellow
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
--}}} Ale

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
