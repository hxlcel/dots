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

      -- ### Neotest & DAP
      { "<leader>t", group = "[t]est" },

      { "<leader>d", group = "[d]ebug" },

      -- ### Misc
      { "<leader>m", group = "Snipe [m]arks"},

      -- ###---- ICONS ----###
      { "<leader>e", icon = "",},
      { "<leader>f", icon = "󱧶",},
      { "<leader>T", icon = "",},
      -- { "<leader>d", icon = ""}
    },
  },
  -- stylua: ignore end
}

-- require("which-key").add({
--   { "s", group = "surround" },
-- }),
