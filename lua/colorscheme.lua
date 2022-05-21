vim.cmd [[
try
  colorscheme darkspace
  highlight Normal guibg=NONE
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=black
endtry
]]
