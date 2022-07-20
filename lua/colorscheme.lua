vim.opt.background = "dark"     -- Dark Mode
vim.cmd [[
try
  colorscheme onedark
  highlight Normal guibg=NONE
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=black
endtry
]]
