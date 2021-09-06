-- general
lvim.format_on_save = false
lvim.lint_on_save = true

vim.g.tokyonight_italic_functions = true
lvim.colorscheme = "tokyonight"

lvim.builtin.compe.autocomplete = true

-- keymappings
lvim.leader = "space"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true

-- lvim.builtin.zen.active = true
-- lvim.builtin.zen.window.height = 0.90

lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.hide_dotfiles = 0

lvim.builtin.telescope.path_display = { "shorten" }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.highlight.enabled = true

-- Additional Plugins
lvim.plugins = {
  {"lunarvim/colorschemes"},
  {"folke/tokyonight.nvim"},
  {"Raimondi/delimitMate"},
  {"tpope/vim-projectionist"},
  {"tpope/vim-surround"},
  {"editorconfig/editorconfig-vim"},
  {"mklabs/split-term.vim"},
  {"folke/zen-mode.nvim"},
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        dimming = {
          alpha = 0.25, -- amount of dimming
        }
      }
    end
  },
  {
      "ray-x/lsp_signature.nvim",
      config = function() require"lsp_signature".on_attach() end,
      event = "InsertEnter"
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
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim"
  }
}

vim.g.rooter_patterns = {
  "package.json",
  "src",
  ".git"
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }


lvim.builtin.which_key.mappings["A"] = {
  name = "Projectionist",
  a = { ":A<cr>", "Open Alternate" },
  s = { ":AS<cr>", "Open Alternate in split" },
  v = { ":AV<cr>", "Open Alternate in vertical split" },
}
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMod<CR>", "Zen Mode" }
lvim.builtin.which_key.mappings["v"] = { "<cmd>vs<CR>", "Split vertically" }
