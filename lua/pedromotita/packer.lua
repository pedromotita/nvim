-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Mason
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- Colorschmes
  use 'Mofiqul/vscode.nvim'

  -- Airline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
 
  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  --  Harpoon
  use 'theprimeagen/harpoon'

  -- Telescope
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.3',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- LSP (nvim native lsp client)
  use 'neovim/nvim-lspconfig'

  -- Code highlight
  use 'RRethy/vim-illuminate'

  -- Code completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'ray-x/lsp_signature.nvim'

  -- Gitsigns
  use 'lewis6991/gitsigns.nvim'
end)
