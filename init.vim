" {{{ Source configuraton files
source $HOME/.config/nvim/settings/plugins.vim
source $HOME/.config/nvim/settings/base.vim
source $HOME/.config/nvim/settings/functions.vim
source $HOME/.config/nvim/settings/mappings.vim
source $HOME/.config/nvim/settings/aucommands.vim
source $HOME/.config/nvim/settings/abbreviations.vim
source $HOME/.config/nvim/settings/coc-settings.vim
source $HOME/.config/nvim/settings/appearance.vim
" }}} Source configuraton files
" Run shell scripts in bash
if &shell =~# 'fish$'
  set shell=/bin/bash
endif

" vim: foldmethod=marker
