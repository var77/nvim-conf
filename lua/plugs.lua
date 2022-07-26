require("packer").startup(
  function(use)
    -- package manager
    use "wbthomason/packer.nvim"

    -- Terminal app
    use {"akinsho/toggleterm.nvim"}

    -- Debugger
    use "mfussenegger/nvim-dap"
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
    use {"theHamsta/nvim-dap-virtual-text", requires = {"mfussenegger/nvim-dap"}}
    use "David-Kunz/jester"
    use "nvim-telescope/telescope-dap.nvim"

    -- Helper functions
    use "nvim-lua/plenary.nvim"
    use "svermeulen/vimpeccable"

    use "neovim/nvim-lspconfig"
    use "onsails/lspkind-nvim"
    use "williamboman/nvim-lsp-installer"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "TovarishFin/vim-solidity"

    -- Fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}

    -- Clipboard
    use {
      "AckslD/nvim-neoclip.lua",
      requires = {
        {"nvim-telescope/telescope.nvim"}
      },
      config = function()
        require("neoclip").setup(
          {
            history = 1000,
            enable_persistent_history = false,
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

    --Using git
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }
    use "nvim-treesitter/playground"

    use "l3mOn4d3/luasnip"

    -- color scheme
    use "marko-cerovac/material.nvim"

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

    use "mhartington/formatter.nvim"

    -- TO SORT AND REMOVE AFTER

    use "tpope/vim-fugitive"
    use "mbbill/undotree"
    use "preservim/nerdcommenter"

    use "phanviet/vim-monokai-pro"
    use "vim-airline/vim-airline"
  end
)

-- color scheme and lua-line
require("material.util").load()
require("material").setup(
  {
    material_style = "oceanic",
    material_italic_comments = true,
    material_italic_keywords = true,
    material_italic_functions = true,
    material_italic_variables = false,
    material_contrast = true,
    material_borders = false,
    material_disable_background = false
  }
)

require("lualine").setup {
  options = {
    theme = "material-nvim"
  }
}

require "nvim-treesitter.configs".setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  },
  indent = {
    enable = true
  }
}

require "plugins_setup.telescope"
require "plugins_setup.cmp"
require "plugins_setup.lspconfig"
require "plugins_setup.nvim-tree"
require "plugins_setup.formatter"
require "plugins_setup.toggleterm"
require "plugins_setup.nvim-dap"
require "tests"

require("gitsigns").setup {
  signs = {
    add = {hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn"},
    change = {hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"},
    delete = {hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"},
    topdelete = {hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"},
    changedelete = {hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"}
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns.actions".next_hunk()<CR>\''},
    ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns.actions".prev_hunk()<CR>\''},
    ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["v <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ["v <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    -- Text objects
    ["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 1000,
    virt_text_pos = "eol"
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  word_diff = false,
  diff_opts = {
    internal = true -- If luajit is present
  }
}
