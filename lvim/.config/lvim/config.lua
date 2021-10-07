-- general
lvim.format_on_save = true
lvim.colorscheme = "nightfox"
lvim.leader = "space"

-- Treesitter parsers change this to a table of the languages you want i.e. {"java", "python", javascript}
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.telescope.path_display = { "shorten" }

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
  {"folke/tokyonight.nvim"},
  {"pappasam/papercolor-theme-slim"},
  {
      "ray-x/lsp_signature.nvim",
      config = function() require"lsp_signature".on_attach() end,
      event  = "BufRead"
  },
  {"Raimondi/delimitMate"},
  {"tpope/vim-projectionist"},
  {"tpope/vim-surround"},
  {"editorconfig/editorconfig-vim"},
  {"mklabs/split-term.vim"},
  {"folke/zen-mode.nvim"},
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
  },
  { 
    "beauwilliams/focus.nvim", 
    config = function() 
      require("focus").setup({
        hybridnumber = true,
        -- winhighlight = true
      })
    end 
  }
}

lvim.builtin.which_key.mappings["A"] = {
  name = "Projectionist",
  a = { ":A<cr>", "Open Alternate" },
  s = { ":AS<cr>", "Open Alternate in split" },
  v = { ":AV<cr>", "Open Alternate in vertical split" },
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
