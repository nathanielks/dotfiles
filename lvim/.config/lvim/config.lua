-- general
lvim.format_on_save = true
-- lvim.colorscheme = "nightfox"
-- vim.o.background = "dark"
lvim.colorscheme = "PaperColorSlim"
vim.o.background = "light"
lvim.leader = "space"

-- Treesitter parsers change this to a table of the languages you want i.e. {"java", "python", javascript}
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.telescope.path_display = { "shorten" }

-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "json" }
  },
  {
    command = "eslint_d",
    filetypes = { "vue", "javascript", "javascriptreact" }
  }
}


-- Linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint_d",
    filetypes = { "vue", "javascript", "javascriptreact" }
  }
}

-- Additional Plugins
-- lvim.plugins = {
--     {"lunarvim/colorschemes"},
--     {"folke/tokyonight.nvim"}, {
--         "ray-x/lsp_signature.nvim",
--         config = function() require"lsp_signature".on_attach() end,
--         event = "BufRead"
--     }
-- }
lvim.plugins = {
  {"lunarvim/colorschemes"},
  {"EdenEast/nightfox.nvim"},
  -- {"folke/tokyonight.nvim"},
  {"pappasam/papercolor-theme-slim"},
  {
      "ray-x/lsp_signature.nvim",
      config = function() require"lsp_signature".on_attach() end,
      event  = "BufRead"
  },
  {"Raimondi/delimitMate"},
  {"tpope/vim-projectionist"},
  {"tpope/vim-surround"},
  {"tpope/vim-eunuch"},
  {"editorconfig/editorconfig-vim"},
  {"mklabs/split-term.vim"},
  {"folke/zen-mode.nvim"},
    {
      "folke/todo-comments.nvim",
      config = function()
        require("todo-comments").setup()
      end,
    },
  {
    "folke/trouble.nvim",
    requuires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "abecodes/tabout.nvim",
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>', -- key to trigger tabout
        act_as_tab = true, -- shift content if tab out is not possible
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          {open = "'", close = "'"},
          {open = '"', close = '"'},
          {open = '`', close = '`'},
          {open = '(', close = ')'},
          {open = '[', close = ']'},
          {open = '{', close = '}'}
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
      }
    end,
    wants = {'nvim-treesitter'}, -- or require if not used so far
    --after = {'completion-nvim'} -- if a completion plugin is using tabs load it before
  },
  {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup({
        hybridnumber = true,
        -- winhighlight = true
      })
    end
  },
  {
    "phaazon/hop.nvim",
    as = 'hop',
    config = function ()
      require('hop').setup()
    end
  },
  {
    "cormacrelf/dark-notify",
    config = function ()
      require('dark_notify').run({
        schemes = {
          dark = "nightfox",
          light = "PaperColorSlim"
        }
      })
    end
  },
  {
    "nvim-treesitter/nvim-tree-docs",
    requires = "nvim-treesitter/nvim-treesitter",
    config = function ()
      require "nvim-treesitter.configs".setup({
        tree_docs = {
          enable = true,
          keymaps = {
            doc_node_at_cursor = 'fb',
            doc_all_in_range = 'fb'
          },
          spec_config = {
            jsdoc = {
              slots = {
                class = {
                  memberof = false
                },
                member = {
                  memberof = false
                },
                method = {
                  memberof = false
                }
              }
            }
          }
        }
      })
    end
  }
}

lvim.builtin.which_key.mappings["s"]["T"] = {
  "<cmd>TodoTelescope<cr>", "TODOs"
}
lvim.builtin.which_key.mappings["A"] = {
  name = "Projectionist",
  a = { ":A<cr>", "Open Alternate" },
  s = { ":AS<cr>", "Open Alternate in split" },
  v = { ":AV<cr>", "Open Alternate in vertical split" },
}

lvim.builtin.which_key.mappings["E"] = {
  name = "Eunuch",
  d = {':Delete<cr>', 'Delete a buffer and the file on disk simultaneously.'},
  m = {':Move<cr>', 'Rename a buffer and the file on disk simultaneously.'},
  r = {':Rename<cr>', "Like :Move, but relative to the current file's containing directory."},
  c = {':Chmod<cr>', 'Change the permissions of the current file.'},
  M = {':Mkdir<cr>', 'Create a directory, defaulting to the parent of the current file.'},
  w = {':Wall<cr>', 'Write every open window. Handy for kicking off tools like guard.'},
  W = {':SudoWrite<cr>', 'Write a privileged file with sudo.'},
  e = {':SudoEdit<cr>', 'Edit a privileged file with sudo.'},
}
lvim.builtin.which_key.mappings["F"] = {
  name = "+fold",
  O = {":set foldlevel=20", 'open all'},
  C = {":set foldlevel=0", 'close all'},
  c = {":foldclose", 'close'},
  o = {":foldopen", 'open'}
}

lvim.builtin.which_key.mappings["Z"] = { "<cmd>ZenMod<CR>", "Zen Mode" }
lvim.builtin.which_key.mappings["V"] = { "<cmd>FocusSplitNicely<CR>", "Split vertically" }
lvim.builtin.which_key.mappings["h"] = {
  name = "Hop.nvim",
  w = { "<cmd>HopWord<cr>", "hop around by highlighting words" },
  p = { "<cmd>HopPattern<cr>", "hop around by matching against a pattern (as with /)" },
  o = { "<cmd>HopChar1<cr>", "type a single key and hop to any occurrence of that key in the document." },
  t = { "<cmd>HopChar2<cr>", "type a bigram (two keys) and hop to any occurrence of that bigram in the document" },
  l = { "<cmd>HopLine<cr>", "jump to any visible line in your buffer" },
}
lvim.builtin.which_key.mappings["H"] = { "<cmd>nohlsearch<CR>", "No Highlight" }
lvim.builtin.which_key.mappings["l"]["T"] = { "<cmd>TroubleToggle<CR>", "Trouble Quickfix List"  }
