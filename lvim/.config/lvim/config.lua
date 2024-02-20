lvim.log.level = "warn"
lvim.format_on_save = false -- set to true on better machine
-- lvim.colorscheme = "tokyonight"
-- lvim.colorscheme = "tokyonight-storm"
-- lvim.colorscheme = "tokyonight-day"
-- lvim.colorscheme = "nightfox"
lvim.colorscheme = "dawnfox"
-- vim.o.background = "light"
-- lvim.colorscheme = "github_light"
lvim.leader = "space"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
vim.o.timeoutlen = 100

vim.opt.textwidth = 80
vim.opt.formatoptions = {
  ["1"] = true,
  ["2"] = true, -- Use indent from 2nd line of a paragraph
  q = true,     -- continue comments with gq"
  c = true,     -- Auto-wrap comments using textwidth
  r = true,     -- Continue comments when pressing Enter
  n = true,     -- Recognize numbered lists
  t = false,    -- autowrap lines using text width value
  j = true,     -- remove a comment leader when joining lines.
  -- Only break if the line was not longer than 'textwidth' when the insert
  -- started and only at a white character that has been entered during the
  -- current insert command.
  l = true,
  v = true,
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "cmake",
  -- "common",
  "css",
  "fish",
  "go",
  "graphql",
  "hcl",
  "html",
  "http",
  "javascript",
  "jsdoc",
  "json",
  "json5",
  "jsonc",
  "latex",
  "lua",
  "make",
  "markdown",
  "php",
  "prisma",
  "pug",
  "python",
  "regex",
  "ruby",
  "rust",
  "scss",
  "svelte",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vue",
  "yaml"
}

lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.telescope.path_display = { "shorten" }
lvim.builtin.project.manual_mode = true

-- Formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettier",
    filetypes = { "json" }
  },
  {
    command = "eslint",
    filetypes = { "vue", "javascript", "javascriptreact" }
  },
  {
    command = "black",
    filetypes = { "python" }
  },
}


-- Linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint",
    filetypes = { "vue", "javascript", "javascriptreact" }
  },
  {
    command = "flake8",
    filetypes = { "python" }
  },
}


lvim.plugins = {
  { "lunarvim/colorschemes" },
  {
    "folke/tokyonight.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- opts = {},
    -- config = function()
    --   require("tokyonight").setup({
    --     -- use the night style
    --     -- style = "night",
    --     style = "day",
    --     -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    --     on_highlights = function(hl, colors)
    --       hl.Cursor = {
    --         bg = colors.bg_dark,
    --         fg = "#e1e2e7"
    --       }
    --       hl.CursorColumn = {
    --         bg = colors.bg_dark
    --       }
    --       hl.CursorIM = {
    --         bg = "#3760bf",
    --         fg = "#e1e2e7"
    --       }
    --       hl.CursorLine = {
    --         bg = colors.bg_dark
    --       }
    --       hl.CursorLineNr = {
    --         fg = "#68709a"
    --       }
    --     end
    --   })
    -- end
  },
  { "EdenEast/nightfox.nvim" },
  { "mvpopuk/inspired-github.vim" },
  { "tpope/vim-surround" },
  { "tpope/vim-eunuch" },
  { "pappasam/papercolor-theme-slim" },
  {
    "ray-x/lsp_signature.nvim",
    config = function() require "lsp_signature".on_attach() end,
    event  = "BufRead"
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {
        keywords = {
          QSTN = {
            icon = "",
            color = "warning"
          }
        }
      }
    end,
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

  { "Raimondi/delimitMate" },
  { "tpope/vim-projectionist" },
  { "mklabs/split-term.vim" },
  { "folke/zen-mode.nvim" },
  -- { "simrat39/symbols-outline.nvim" },
  {
    "stevearc/aerial.nvim",
    config = function()
      require('aerial').setup({
        -- Options for the floating nav windows
        nav = {
          -- Jump to symbol in source window when the cursor moves
          autojump = true,
          -- Show a preview of the code in the right column, when there are no child symbols
          preview = true,
          -- Keymaps in the nav window
          -- keymaps = {
          --   ["<CR>"] = "actions.jump",
          --   ["<2-LeftMouse>"] = "actions.jump",
          --   ["<C-v>"] = "actions.jump_vsplit",
          --   ["<C-s>"] = "actions.jump_split",
          --   ["h"] = "actions.left",
          --   ["l"] = "actions.right",
          --   ["<C-c>"] = "actions.close",
          -- },
        },
      })
    end
  },
  {
    "cormacrelf/dark-notify",
    config = function()
      require('dark_notify').run({
        schemes = {
          dark = "tokyonight-storm",
          light = "dawnfox"
        }
      })
    end
  },
  -- { "mg979/vim-visual-multi", }
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  -- {
  --   "rmagatti/goto-preview",
  --   config = function()
  --     require('goto-preview').setup {
  --       width = 120,              -- Width of the floating window
  --       height = 25,              -- Height of the floating window
  --       default_mappings = false, -- Bind default mappings
  --       debug = false,            -- Print debug information
  --       opacity = nil,            -- 0-100 opacity level of the floating window where 100 is fully transparent.
  --       post_open_hook = nil      -- A function taking two arguments, a buffer and a window to be ran as a hook.
  --       -- You can use "default_mappings = true" setup option
  --       -- Or explicitly set keybindings
  --       -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
  --       -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
  --       -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
  --     }
  --   end
  -- },
  -- {
  --   "Pocco81/auto-save.nvim",
  --   config = function()
  --     require("auto-save").setup()
  --   end,
  -- },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
}

-- Escape using jj instead of esc key
lvim.keys.insert_mode["jj"] = "<Esc>"

-- Cycle between tabs
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.builtin.which_key.mappings["s"]["T"] = {
  "<cmd>TodoTelescope<cr>", "TODOs"
}

lvim.builtin.which_key.vmappings['x'] = { '"_x', 'X to black hole' }
lvim.builtin.which_key.vmappings['d'] = { '"_d', 'Black hole d' }
lvim.builtin.which_key.vmappings['D'] = { '"_V', 'Black hole D' }
lvim.builtin.which_key.vmappings['p'] = { '"_dP', 'Paste, no yank' }
lvim.builtin.which_key.vmappings['c'] = { '""d', 'Cut' }
lvim.builtin.which_key.vmappings['C'] = { '""D', 'Cut big D?' }

lvim.builtin.which_key.mappings["A"] = {
  name = "Projectionist",
  a = { ":A<cr>", "Open Alternate" },
  s = { ":AS<cr>", "Open Alternate in split" },
  v = { ":AV<cr>", "Open Alternate in vertical split" },
}

lvim.builtin.which_key.mappings["E"] = {
  name = "Eunuch",
  d = { ':Delete<cr>', 'Delete a buffer and the file on disk simultaneously.' },
  D = { ':Delete!<cr>', 'Force delete a buffer and the file on disk simultaneously.' },
  m = { ':Move ', 'Rename a buffer and the file on disk simultaneously.' },
  r = { ':Rename ', "Like :Move, but relative to the current file's containing directory." },
  c = { ':Chmod ', 'Change the permissions of the current file.' },
  M = { ':Mkdir ', 'Create a directory, defaulting to the parent of the current file.' },
  w = { ':Wall<cr>', 'Write every open window. Handy for kicking off tools like guard.' },
  W = { ':SudoWrite<cr>', 'Write a privileged file with sudo.' },
  e = { ':SudoEdit<cr>', 'Edit a privileged file with sudo.' },
}
lvim.builtin.which_key.mappings["F"] = {
  name = "+fold",
  O = { ":set foldlevel=20", 'open all' },
  C = { ":set foldlevel=0", 'close all' },
  c = { ":foldclose", 'close' },
  o = { ":foldopen", 'open' }
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
-- lvim.builtin.which_key.mappings["l"]["o"] = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" }
lvim.builtin.which_key.mappings["l"]["o"] = { "<cmd>AerialNavToggle<CR>", "Symbols Outline" }

-- lvim.builtin.which_key.mappings["l"]["R"] = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "references" }
-- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
-- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
-- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")


lvim.builtin.which_key.mappings["l"]["R"] = { "<cmd>TroubleToggle lsp_references<cr>", "references" }
lvim.builtin.which_key.mappings["l"]["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
lvim.builtin.which_key.mappings["Q"] = { ":qa!<CR>", "Quit all" }
