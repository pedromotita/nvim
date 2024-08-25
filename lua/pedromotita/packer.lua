-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Mason
  use "williamboman/mason.nvim"

  -- Colorschmes
  use 'Mofiqul/adwaita.nvim'
  use 'tomasiser/vim-code-dark'
  use 'Mofiqul/vscode.nvim'
 
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

  -- Code completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'ray-x/lsp_signature.nvim'

  -- Gitsigns
  use 'lewis6991/gitsigns.nvim'
end)
