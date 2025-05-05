return {
  -- TODO: customise!
  "folke/which-key.nvim",
  event = "VeryLazy",
  sort = "order",
  -- stylua: ignore start
  keys = {
    { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)" },
  },

  opts = {
    triggers = {
      { "<leader>", mode = { "n", "v" } },
      { "s", mode = { "n", "v" } },
      { "m", mode = { "n", "v" } },
    },

    spec = {

      -- ###---- GROUPS ----###
      { "<leader>y", group = "[y]azi"},

      -- ### Mini.nvim
      { "s", group = "[s]urround" },

      -- ### Snacks
      { "<leader>S", group = "[S]earch" },
      { "<leader>F", group = "[F]ind" },
      { "<leader>l", group = "[l]sp" },
      { "<leader>Sg", group = "[g]rep" },
      { "<leader>g", group = "[g]it" },

      -- ### Neotest
      { "<leader>t", group = "[t]est" },


      -- ###---- ICONS ----###
      { "<leader>e", icon = "",},
      { "<leader>f", icon = "󱧶",},
      { "<leader>T", icon = "",},
    },
  },
  -- stylua: ignore end
}

-- require("which-key").add({
--   { "s", group = "surround" },
-- }),
