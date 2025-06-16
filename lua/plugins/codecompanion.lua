return {
  {
    "j-hui/fidget.nvim",
    opts = {},
  },

  {
    "ravitemer/mcphub.nvim",
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup({
        extensions = {
          codecompanion = {
            show_result_in_chat = true,
            make_vars = true,
            make_slash_commands = true,
          },
        },
      })
    end,
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion" },
        ignore_buftypes = {},
      },
    },
  },

  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
      })
    end,
  },

  {
    "HakonHarnes/img-clip.nvim",
    opts = {
      filetypes = {
        codecompanion = {
          prompt_for_file_name = false,
          template = "[Image]($FILE_PATH)",
          use_absolute_path = true,
        },
      },
    },
  },

  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "banjo/contextfiles.nvim",
      "supermaven-inc/supermaven-nvim",
    },

    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "anthropic",
          },
          inline = {
            -- adapter = "copilot",
            adapter = "supermaven",
          },
          cmd = {
            adapter = "deepseek",
          },
        },
        adapters = {
          anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                api_key = os.getenv("ANTHROPIC_API_KEY"),
              },
            })
          end,
        },
        extensions = {
          mcphub = {
            callback = "mcphub.extensions.codecompanion",
            opts = {
              show_result_in_chat = true, -- Show mcp tool results in chat
              make_vars = true, -- Convert resources to #variables
              make_slash_commands = true, -- Add prompts as /slash commands
            },
          },
          contextfiles = {
            opts = {
              -- your contextfiles configuration here
              -- or leave it empty to use the default configuration
            },
          },
        },
      })

      -- local progress = require("fidget.progress")
      -- progress.setup({
      --   spinner = "dots",
      --   format = "🔍 CodeCompanion",
      --   timeout = 1000,
      -- })
      -- local handles = {}
      -- local group = vim.api.nvim_create_augroup("CodeCompanionFidget", {})
      --
      -- vim.api.nvim_create_autocmd("User", {
      --   pattern = "CodeCompanionRequestStarted",
      --   group = group,
      --   callback = function(e)
      --     handles[e.data.id] = progress.handle.create({
      --       title = "CodeCompanion",
      --       message = "🔍 Thinking...",
      --       lsp_client = { name = e.data.adapter.formatted_name or "codecompanion" },
      --     })
      --   end,
      -- })
      --
      -- vim.api.nvim_create_autocmd("User", {
      --   pattern = "CodeCompanionRequestFinished",
      --   group = group,
      --   callback = function(e)
      --     local h = handles[e.data.id]
      --     if h then
      --       h.message = e.data.status == "success" and "Done" or "Failed"
      --       h:finish()
      --       handles[e.data.id] = nil
      --     end
      --   end,
      -- })

      vim.keymap.set("n", "<leader>ac", ":CodeCompanionChat Toggle<CR>", { desc = "Toggle CodeCompanion" })
    end,
  },
}
