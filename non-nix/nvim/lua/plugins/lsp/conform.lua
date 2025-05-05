return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        python = { "black" },
        lua = { "stylua" },
        nix = { "alejandra" },
      },

      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,

  -- stylua: ignore
  keys = {
    { "<leader>C", function() require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 1000, }) end, desc = "[C]onform Format file or range" },
  },
}
