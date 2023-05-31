require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
})
vim.opt.background = "dark"     -- Dark Mode
vim.cmd [[
  colorscheme catppuccin
  set background=dark
  highlight Normal guibg=NONE
  highlight Comment gui=italic
]]
