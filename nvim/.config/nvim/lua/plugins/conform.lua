-- Copyright @jellydn, Apache License Version 2.0
-- https://github.com/jellydn
-- https://github.com/jellydn/lazy-nvim-ide/blob/aab82abedf7703315baf6ee3b61f231a7b1f505a/lua/plugins/conform.lua

local Lsp = require("utils.lsp")

return {
  -- Setup config for formatter
  {
    "conform.nvim",
    keys = {
      -- Add keymap for show info
      { "<leader>cn", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
    },
    opts = {
      formatters_by_ft = {
        fish = {},
        -- Conform will run multiple formatters sequentially
        go = { "goimports", "gofmt" },
        python = { "ruff_fix", "ruff_format" },
        php = { "pint" },
        rust = { "rustfmt" },
        -- Use a sub-list to run only the first available formatter
        yaml = { "biome", "prettierd", "prettier", stop_after_first = true },
        ["markdown"] = { "biome", "prettierd", "prettier", stop_after_first = true },
        ["markdown.mdx"] = { "biome", "prettierd", "prettier", stop_after_first = true },
        ["javascript"] = { "deno_fmt", "biome", "prettierd", "prettier", stop_after_first = true },
        ["javascriptreact"] = { "rustywind", "deno_fmt", "biome", "prettierd", "prettier", stop_after_first = true },
        ["typescript"] = { "deno_fmt", "biome", "prettierd", "prettier", stop_after_first = true },
        ["typescriptreact"] = { "rustywind", "deno_fmt", "biome", "prettierd", "prettier", stop_after_first = true },
        ["svelte"] = { "rustywind", "deno_fmt", "biome", "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
        biome = {
          condition = function()
            local path = Lsp.biome_config_path()
            -- Skip if biome.json is in nvim
            local is_nvim = path and string.match(path, "nvim")

            if path and not is_nvim then
              return true
            end

            return false
          end,
        },
        deno_fmt = {
          condition = function()
            return Lsp.deno_config_exist()
          end,
        },
        dprint = {
          condition = function()
            return Lsp.dprint_config_exist()
          end,
        },
        prettier = {
          condition = function()
            local path = Lsp.biome_config_path()
            -- Skip if biome.json is in nvim
            local is_nvim = path and string.match(path, "nvim")

            if path and not is_nvim then
              return false
            end

            return true
          end,
        },
        prettierd = {
          condition = function()
            local path = Lsp.biome_config_path()
            -- Skip if biome.json is in nvim
            local is_nvim = path and string.match(path, "nvim")

            if path and not is_nvim then
              return false
            end

            return true
          end,
        },
      },
    },
  },
}
