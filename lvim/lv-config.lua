--[[
O is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]] -- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
O.format_on_save = false
O.lint_on_save = true
O.completion.autocomplete = true
O.colorscheme = "spacegray"
O.default_options.wrap = true
O.default_options.timeoutlen = 100

-- TODO User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
O.plugin.dashboard.active = true
O.plugin.terminal.active = true

O.plugin.zen.active = true
O.plugin.zen.window.height = 0.90

O.plugin.nvimtree.side = "left"
O.plugin.nvimtree.hide_dotfiles = 0

O.plugin.telescope.path_display = { "shorten" }
-- dashboard
-- O.dashboard.custom_header = {""}
-- O.dashboard.footer = {""}

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "all"
O.treesitter.ignore_install = {"haskell"}
O.treesitter.highlight.enabled = true

O.lang.clang.diagnostics.virtual_text = true
O.lang.clang.diagnostics.signs = true
O.lang.clang.diagnostics.underline = true

-- python
-- add things like O.python.linter.flake8.exec_path
-- O.python.linter = 'flake8'
O.lang.python.isort = true
O.lang.python.diagnostics.virtual_text = true
O.lang.python.diagnostics.signs = true
O.lang.python.diagnostics.underline = true
O.lang.python.analysis.type_checking = "off"
O.lang.python.analysis.auto_search_paths = true
O.lang.python.analysis.use_library_code_types = true

-- javascript
O.lang.tsserver.formatter = 'prettier'
O.lang.tsserver.linter = nil
O.lang.tsserver.autoformat = false

O.lang.efm.autoformat = false

-- php
O.lang.php.environment.php_version = "7.4"
O.lang.php.diagnostics.signs = true
O.lang.php.diagnostics.underline = true
O.lang.php.filetypes = {"php", "phtml"}
O.lang.php.format = {
  format = {
    default = "psr12"
  }
}


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- O.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

-- Additional Plugins
-- O.custom_plugins = {{"windwp/nvim-ts-autotag"}}
O.user_plugins = {{
    -- System
    "Raimondi/delimitMate",
    "tpope/vim-projectionist",
    "tpope/vim-surround",
    "editorconfig/editorconfig-vim",
    "mklabs/split-term.vim",
    "folke/twilight.nvim"
}}

-- Projectionist
O.user_which_key = {
    A = {
        name = "Projectionist",
        a = { ":A<cr>", "Open Alternate" },
        s = { ":AS<cr>", "Open Alternate in split" },
        v = { ":AV<cr>", "Open Alternate in vertical split" },
    },
    b = {
      name = "Buffers",
      j = { "<cmd>BufferPick<cr>", "jump to buffer" },
      f = { "<cmd>Telescope buffers<cr>", "Find buffer" },
      w = { "<cmd>BufferWipeout<cr>", "wipeout buffer" },
      e = {
        "<cmd>BufferCloseAllButCurrent<cr>",
        "close all but current buffer",
      },
      h = { "<cmd>BufferCloseBuffersLeft<cr>", "close all buffers to the left" },
      l = {
        "<cmd>BufferCloseBuffersRight<cr>",
        "close all BufferLines to the right",
      },
      D = {
        "<cmd>BufferOrderByDirectory<cr>",
        "sort BufferLines automatically by directory",
      },
      L = {
        "<cmd>BufferOrderByLanguage<cr>",
        "sort BufferLines automatically by language",
      },
    },
}
