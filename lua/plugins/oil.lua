return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>e",
      function()
        local oil = require("oil")
        -- Check if the current buffer is an Oil buffer
        if vim.bo.filetype == "oil" then
          vim.cmd("close")
        else
          oil.open_float()
        end
      end,
      desc = "Toggle Oil Explorer",
    },
  },
  opts = {
    columns = { "size", "icon" },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name)
        return name == ".." or name == ".git"
      end,
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)

    -- Set buffer-local keymap for <C-h> only in Oil buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      callback = function(args)
        vim.keymap.set("n", "<C-h>", function()
          require("oil").open()
        end, { buffer = args.buf, desc = "Open parent directory in Oil" })
      end,
    })
  end,
}
