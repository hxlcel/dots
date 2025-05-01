return {
  -- TODO: customise!
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {
      "<leader>mp",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end,
      { desc = "Format file or range" },
    },
  },
  opts = {
    triggers = {
      { "<leader>", mode = { "n", "v" } },
      { "s", mode = { "n", "v" } },
      { "m", mode = { "n", "v" } },
    },
    spec = {
      { "m", group = "Neotest" },
      { "s", group = "[s]urround" },
      { "<leader>s", group = "[s]earch" },
    },
  },
}

-- require("which-key").add({
--   { "s", group = "surround" },
-- }),
