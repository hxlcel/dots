return{
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
  },
  keys = { { "<leader>ee", "<CMD>Neotree toggle <CR>", desc = "Neotree Toggle" }, },
  -- require("neo-tree").setup({
  --   popup_border_style = "rounded",
  -- })
}
