-- Copyright @jellydn, Apache License Version 2.0
-- https://github.com/jellydn
-- https://github.com/jellydn/lazy-nvim-ide/blob/aab82abedf7703315baf6ee3b61f231a7b1f505a/lua/plugins/extras/biome.lua

local Lsp = require("utils.lsp")

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "biome" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        -- tsserver = {
        --   on_attach = function(client)
        --     -- this is important, otherwise tsserver will format ts/js
        --     -- files which we *really* don't want.
        --     client.server_capabilities.documentFormattingProvider = false
        --   end,
        -- },
        biome = {
          root_dir = function()
            if Lsp.biome_config_exists() then
              return Lsp.biome_config_path()
            end

            return vim.fn.stdpath("config")
          end,
          keys = {
            {
              "<leader>cb",
              function()
                -- NOTE:Migrate to LSP later if it's available
                local file = vim.fn.fnameescape(vim.fn.expand("%:p")) -- Escape file path for shell
                vim.cmd("silent !biome lint --write " .. file)
              end,
              desc = "Biome lint fix",
            },
          },
        },
      },
      setup = {},
    },
  },
}
