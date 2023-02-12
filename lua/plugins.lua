-- [[ plug.lua ]]
local fn = vim.fn

--{{{ Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end
---}}} Automatically install packer

--{{{ Reload neovim when plugins.lua file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
--}}} Reload neovim when plugins.lua file is saved

--{{{ Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end
--}}} protected call to packer

--{{{ Packer popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
--}}} Packer popup window

--{{{ Helpers
return packer.startup(function(use)
  use "wbthomason/packer.nvim"  -- Have packer manage itself
  use "nvim-lua/popup.nvim"     -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"   -- Useful lua functions used by lots of plugins
  use "sharkdp/fd"               -- Finder, useful with telescope
  use "windwp/nvim-autopairs"   -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"   -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use "junegunn/fzf"            -- Advanced fuzzy finder
  use "kshenoy/vim-signature"   -- Place, toggle and display marks
  use "dense-analysis/ale"      -- Advanced Linter Engine
  use "Yggdroot/indentLine"     -- Display thin vertical lines at indent levels
  use "cespare/vim-toml"        -- Syntax for TOML
  use "vim-pandoc/vim-pandoc"   -- Pandoc integration
  use "vim-pandoc/vim-pandoc-syntax"    -- Pandoc syntax
  use "khaveesh/vim-fish-syntax"    -- Fish syntax
  use "dhruvasagar/vim-table-mode"  -- Easy tables
  use "gabrielelana/vim-markdown"   -- Better Markdown syntax highlighting
  -- use "akinsho/toggleterm.nvim"
  -- use "ahmedkhalf/project.nvim"
  -- use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  -- use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use "wincent/loupe"   -- Make Search/Replace Very Magic
  use "salkin-mada/openscad.nvim"   -- Syntax etc. for OpenSCAD
  --}}} Helpers

  --{{{ Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "joshdick/onedark.vim"        -- OneDark colorscheme
  use "ts-26a/vim-darkspace"         -- DarkSpace colorscheme
  use "wuelnerdotexe/vim-enfocado"  -- enfocado colorscheme
  use "drewtempelmeyer/palenight.vim"   -- palenight
  use "ellisonleao/gruvbox.nvim"        -- gruvbox
  --}}} Colorschemes

  --{{{ Completion
  use "hrsh7th/nvim-cmp"            -- The completion plugin
  use "hrsh7th/cmp-buffer"          -- buffer completions
  use "hrsh7th/cmp-path"            -- path completions
  use "hrsh7th/cmp-cmdline"         -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"    -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  --}}} Completion

  --{{{ Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  --}}} Snippets

  --{{{ LSP
  use "williamboman/mason.nvim"         -- language server and linter installer
  use "williamboman/mason-lspconfig.nvim"   -- Bridge between mason.nvim and nvim-lspconfig
  use "neovim/nvim-lspconfig"           -- enable LSP
  use "tamago324/nlsp-settings.nvim"    -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "simrat39/rust-tools.nvim"        -- extra functionality to rust analyzer
  ---}}} LSP

  --{{{ Telescope
  use "nvim-telescope/telescope.nvim"
  --}}} Telescope

  --{{{ Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  ---}}} Treesitter

  --{{{ Git
  -- use "lewis6991/gitsigns.nvim"
  --}}} Git

  --{{{ Automatically start packer
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
  --}}} Automatically start packer
end)
