require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting background color
    show_end_of_buffer = false,     -- shows the '~' characters after the end
    term_colors = false,            -- sets terminal colors
    dim_inactive = {
        enabled = false,            -- dims bg color of inactive window
        shade = "dark",
        percentage = 0.15,          -- % of shade to apply to inactive window
    },
    no_italic = false,              -- Force no italic
    no_bold = false,                -- Force no bold
    no_underline = false,           -- Force no underline
    styles = {
        comments = { "italic" },    -- italic comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    custom_highlights = {},
    integrations = {
        cmp = true,
        treesitter = true,
    }
})

vim.cmd.colorscheme "catppuccin"
vim.opt.background = "dark"     -- Dark Mode
-- vim.cmd [[
--   colorscheme catppuccin
--   set background=dark
--   highlight Normal guibg=NONE
--   highlight Comment gui=italic
-- ]]
