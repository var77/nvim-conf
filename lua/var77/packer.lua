-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- telescope for search
  use {
    'nvim-telescope/telescope.nvim',
    -- or                            , branch = '0.1.x',
    requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
  }
  -- fuzzy finder for telescope
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

  -- color scheme
  use "marko-cerovac/material.nvim"

  -- tresitter to make AST and highlight text
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  -- trisitter playground so you can see the AST
  use('nvim-treesitter/playground')
  -- for switching buffers
  use('theprimeagen/harpoon')
  -- undotree to manage the undo history
  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  -- LSP server
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- plugin to automatically resize windows
  use("folke/zen-mode.nvim")

  -- neoclip for clipboard history

  -- Clipboard
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {"nvim-telescope/telescope.nvim"},
      {"kkharji/sqlite.lua"}
    },
    config = function()
      require("neoclip").setup(
      {
        history = 1000,
        enable_persistent_history = true,
        length_limit = 1048576,
        continuous_sync = false,
        db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
        filter = nil,
        preview = true,
        default_register = '"',
        default_register_macros = "q",
        enable_macro_history = true,
        content_spec_column = false,
        on_paste = {
          set_reg = false
        },
        on_replay = {
          set_reg = false
        },
        keys = {
          telescope = {
            i = {
              select = "<cr>",
              paste = "<c-p>",
              paste_behind = "<c-k>",
              replay = "<c-q>", -- replay a macro
              delete = "<c-d>", -- delete an entry
              custom = {}
            },
            n = {
              select = "<cr>",
              paste = "p",
              paste_behind = "P",
              replay = "q",
              delete = "d",
              custom = {}
            }
          }
        }
      }
      )
    end
  }

  -- Status line at the bottom
  use {
    "hoob3rt/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  }

  -- File explorer
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons"
  }

  -- Using git
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim"
    }
  }

  -- multi cursors
  use {
    "mg979/vim-visual-multi"
  }

  -- prettier
  use "sbdchd/neoformat"

end)
